import 'package:flutter/material.dart';
import 'package:netflix_ui/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflix_ui/models/full_content_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  final FullContent content;

  const DetailsScreen({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: 500.0,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.content.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
