import 'dart:async';

import 'package:example/image_view.dart';
import 'package:flutter/material.dart';
import 'package:multi_search_flutter/multi_search_flutter.dart';
import 'package:multi_search_flutter/search_indicator_style_enum.dart';

import 'list_generator.dart';

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
  late StreamController<List<ImageView>> _streamList;
  late List<ImageView> imagesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamList = StreamController<List<ImageView>>();
    imagesList = getImages();
    _streamList.sink.add(imagesList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          MultiSearchView(
            searchIndicatorShape: SearchIndicatorShape.dot,
            onSelectItem: (value) {
              filterList(value);
            },
            onSearchComplete: (value) {
              filterList(value);
            },
            onDeleteAlternative: (value) {
              filterList(value);
            },
            onItemDeleted: (value) {
              print(value);
            },
            onSearchCleared: () {
              removeFilter();
            },
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: StreamBuilder(
                stream: _streamList.stream,
                builder: (context, AsyncSnapshot<List<ImageView>>? snapshot) {
                  return ListView(
                      children: ((snapshot != null && snapshot.data != null)
                              ? ((snapshot.data?.isNotEmpty ?? false)
                                  ? (snapshot.data
                                      ?.map((e) => Container(
                                          height: 180,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: e.image))
                                      .toList())
                                  : [])
                              : []) ??
                          []);
                }),
          ),
        ],
      ),
    );
  }

  void filterList(value) {
    _streamList.sink.add(imagesList
        .where((element) => element.name?.contains(value) ?? false)
        .toList());
  }

  void removeFilter() {
    _streamList.sink.add(imagesList);
  }

  @override
  void dispose() {
    _streamList.close();
    super.dispose();
  }
}
