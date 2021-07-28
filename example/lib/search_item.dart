import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({Key? key, required this.label, required this.onTap}) : super(key: key);
  final String label;
  final Function onTap;

  @override
  _SearchItemState createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 10,),
            Text(widget.label, style: TextStyle(fontSize: 20),),
            SizedBox(width: 4,),
            InkWell(onTap: (){
              print('nice');
              widget.onTap();
            },
                child: Icon(Icons.close, size: 15,))
          ],
        ),
        SizedBox(height: 5,),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Container(
              height: 7,
              width: 20,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          ),
        )
      ],
    );
  }
}
