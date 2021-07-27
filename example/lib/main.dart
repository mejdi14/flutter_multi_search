import 'dart:async';

import 'package:example/SearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  void _incrementCounter() {
    setState(() {});
  }

  var showInput;
  late AnimationController _iconAnimationController;
  final streamList = StreamController<List<String>>();
  late ScrollController _scrollController;
  var listSearch = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showInput = true;
    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _scrollController = new ScrollController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                controller: _scrollController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    child: StreamBuilder(
                        stream: streamList.stream,
                        builder:
                            (context, AsyncSnapshot<List<String>>? snapshot) {
                          return ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: ((snapshot != null &&
                                          snapshot.data != null)
                                      ? ((snapshot.data?.isNotEmpty ?? false)
                                          ? (snapshot.data
                                              ?.map((e) => Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      Text(e),
                                                    ],
                                                  ))
                                              .toList())
                                          : [])
                                      : []) ??
                                  []);
                        }),
                  ),
                  if (showInput)
                    Container(
                        padding: EdgeInsets.only(left: 20),
                        width: MediaQuery.of(context).size.width - 40,
                        child: new TextField(
                            onSubmitted: _submitContent,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Search"),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)))
                ],
              ),
            ),
            Container(
              width: 40,
              child: GestureDetector(
                  onTap: () {
                    //listSearch.add('hello');
                    //streamList.sink.add(listSearch);

                    print('clicked');
                    _iconAnimationController.forward();
                    setState(() {
                      showInput = true;
                    });
                    _moveScrollToEnd();

                    //_moveScrollToEnd();
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.search_ellipsis,
                    color: Colors.black,
                    progress: _iconAnimationController,
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _submitContent(String value) {
    listSearch.addAll([
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello',
      'hello'
    ]);
    streamList.sink.add(listSearch);
    setState(() {
      showInput = false;
    });
  }

  void _moveScrollToEnd() {
    new Future.delayed(Duration(seconds: 0), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 850), curve: Curves.ease);
    });
  }
}
