import 'package:flutter/material.dart';
import 'package:netflix_ui/assets.dart';
import 'package:netflix_ui/data/data.dart';
import 'package:netflix_ui/data/full_data.dart';
import 'package:netflix_ui/models/full_content_model.dart';
import 'package:netflix_ui/models/models.dart';
import 'package:netflix_ui/screens/screens.dart';
import 'package:netflix_ui/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key key,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<FullContent> contentsFiltered = List.from(contents);
  TextEditingController _textController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SearchBox(
              hintText: 'Search movies, series, genres etc.',
              textController: _textController,
              onChanged: (String value) {
                setState(() {
                  _isSearching = value != '';
                  contentsFiltered = contents
                      .where((content) => content.name
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
            _isSearching ? SearchedTitle() : SizedBox.shrink(),
            Expanded(
              child: !_isSearching
                  ? MostSearchedList()
                  : SearchedList(
                      contentsFiltered: contentsFiltered,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class MostSearchedTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16.0,
      ),
      width: double.infinity,
      child: Text(
        'Most searched',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class SearchedTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        top: 20.0,
        bottom: 12.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 6.0,
      ),
      width: double.infinity,
      color: Colors.grey[900],
      child: Text(
        'MOVIES, SERIES AND SHOWS',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MostSearchedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contents.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return MostSearchedTitle();
        }
        final FullContent content = contents[index - 1];
        return ContentRow(content: content);
      },
    );
  }
}

class SearchedList extends StatelessWidget {
  final List<FullContent> contentsFiltered;

  const SearchedList({
    Key key,
    this.contentsFiltered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      crossAxisCount: 3,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 0.7,
      children: List.generate(contentsFiltered.length, (index) {
        return ContentBox(content: contentsFiltered[index]);
      }),
    );
  }
}

class ContentBox extends StatelessWidget {
  final FullContent content;

  const ContentBox({
    Key key,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          image: DecorationImage(
            image: AssetImage(content.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ContentRow extends StatelessWidget {
  final FullContent content;

  const ContentRow({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsScreen(content: content)));
      },
      child: Container(
        padding: EdgeInsets.only(right: 10.0),
        margin: EdgeInsets.only(bottom: 2.0),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0), bottomLeft: Radius.circular(4.0)),
        ),
        height: 75.0,
        width: double.infinity, //140
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 140.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        bottomLeft: Radius.circular(4.0)),
                    image: DecorationImage(
                      image: AssetImage(content.bannerUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  content.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.play_circle_outline_sharp,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
