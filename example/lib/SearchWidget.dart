import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  _SearchWidget createState() => new _SearchWidget();
}

class _SearchWidget extends State<SearchWidget> with TickerProviderStateMixin {
  TextEditingController? _textEditingController;
  AnimationController? _controller;
  Animation? _animation;
  Duration? _duration;
  bool? _visible;

  @override
  void initState() {
    _visible = false;
    _duration = Duration(milliseconds: 600);
    _textEditingController = new TextEditingController();
    _controller = AnimationController(vsync: this, duration: _duration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _iconSize = MediaQuery.of(context).size.height * 0.05;
    _animation = Tween(
            begin: 0.0, end: MediaQuery.of(context).size.width - _iconSize - 30)
        .animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.fastOutSlowIn,
    ));

    return new Container(
        child: new Row(children: <Widget>[
      new AnimatedBuilder(
          animation: _controller!,
          builder: (BuildContext context, Widget? child) {
            return Container(
                padding: EdgeInsets.only(left: 20),
                width: _animation!.value,
                child: new TextField(
                    controller: _textEditingController!,
                    onSubmitted: _submitContent,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search"),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)));
          }),
      new Container(
          child: new InkWell(
        splashColor: Colors.transparent,
        child: new Icon((_visible ?? false) ? Icons.close : Icons.search,
            size: _iconSize),
        onTap: _showTextField,
      ))
    ]));
  }

  void _submitContent(String content) {
    _showTextField();
  }

  void _hideAndClearKeyboard() {
    FocusScope.of(context).requestFocus(new FocusNode());
    _textEditingController?.clear();
  }

  void _showTextField() async {
    setState(() {});
    if (_visible == true)
      _controller?.reverse();
    else
      _controller?.forward();
    _hideAndClearKeyboard();
    _visible = !(_visible ?? false);
  }
}
