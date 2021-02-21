import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final Function(String) onChanged;
  final TextEditingController textController;
  final String hintText;

  const SearchBox({
    Key key,
    @required this.onChanged,
    @required this.textController,
    @required this.hintText,
  }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 4.0,
      ),
      color: Colors.grey[800],
      width: double.infinity,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: widget.textController,
        onChanged: (value) {
          isEmpty = value == '';
          widget.onChanged(value);
        },
        style: TextStyle(
          fontSize: 14.0,
          decorationColor: Colors.white,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            decorationColor: Colors.grey[300],
            color: Colors.grey[300],
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[400],
            size: 26.0,
          ),
          suffixIcon: isEmpty ? GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.mic,
              color: Colors.grey[400],
              size: 26.0,
            ),
          ) : GestureDetector(
            onTap: () {
              widget.textController.clear();
              setState(() {
                isEmpty = true;
              });
            },
            child: Icon(
              Icons.clear,
              color: Colors.grey[400],
              size: 26.0,
            ),
          ),
        ),
      ),
    );
  }
}
