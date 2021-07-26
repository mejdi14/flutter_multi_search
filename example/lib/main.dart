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

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  final streamList = StreamController<List<String>>();

  var listSearch = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              child: StreamBuilder(
                  stream: streamList.stream,
                  builder: (context, AsyncSnapshot<List<String>>? snapshot) {
                    return ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: ((snapshot != null && snapshot.data != null)
                                ? ((snapshot.data?.isNotEmpty ?? false)
                                    ? (snapshot.data
                                        ?.map((e) => Text(e))
                                        .toList())
                                    : [])
                                : []) ??
                            []);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                child: GestureDetector(
                    onTap: () {
                      listSearch.add('hello');
                      streamList.sink.add(listSearch);
                    },
                    child: Icon(Icons.add)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
