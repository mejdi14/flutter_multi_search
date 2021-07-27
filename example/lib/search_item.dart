import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 4,),
        Text(widget.label, style: TextStyle(fontSize: 20),),
        SizedBox(width: 4,),
        Icon(Icons.close, size: 15,)
      ],
    );
  }
}
