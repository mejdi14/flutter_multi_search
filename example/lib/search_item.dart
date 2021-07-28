import 'package:example/searchable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({Key? key, required this.data, required this.onTap})
      : super(key: key);
  final Searchable data;
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
        GestureDetector(
          onTap: () {
            widget.data.isSelected?.value =
                !(widget.data.isSelected?.value ?? false);
          },
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                widget.data.label ?? '',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 4,
              ),
              InkWell(
                  onTap: () {
                    print('nice');
                    widget.onTap();
                  },
                  child: Icon(
                    Icons.close,
                    size: 15,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ValueListenableBuilder<bool>(
            valueListenable:
                widget.data.isSelected ?? ValueNotifier<bool>(false),
            builder: (BuildContext context, bool value, Widget? child) {
              return Visibility(
                visible: value,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 7,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
