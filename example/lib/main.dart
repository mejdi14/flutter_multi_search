import 'dart:async';

import 'package:example/search_item.dart';
import 'package:example/searchable.dart';
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
  var showInput;
  late AnimationController _iconAnimationController;
  final streamList = StreamController<List<Searchable>>();
  late ScrollController _scrollController;
  var listSearch = <Searchable>[];
  late TextEditingController _inputController;
  late FocusNode focusNode;
  bool isSearch = true;
  final ValueNotifier<bool> _isSearchIcon = ValueNotifier<bool>(true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _scrollController = new ScrollController();
    _inputController = TextEditingController();
    focusNode = FocusNode();
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
                        builder: (context,
                            AsyncSnapshot<List<Searchable>>? snapshot) {
                          return ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: ((snapshot != null &&
                                          snapshot.data != null)
                                      ? ((snapshot.data?.isNotEmpty ?? false)
                                          ? (snapshot.data
                                              ?.map((e) => SearchItem(
                                                    data: Searchable(
                                                        label: e.label,
                                                        isSelected:
                                                            ValueNotifier<bool>(
                                                                false)),
                                                    onTap: () {
                                                      removeItem(e);
                                                    },
                                                  ))
                                              .toList())
                                          : [])
                                      : []) ??
                                  []);
                        }),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width - 40,
                      child: new TextField(
                          controller: _inputController,
                          onSubmitted: _submitContent,
                          focusNode: focusNode,
                          textInputAction: TextInputAction.search,
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
                    _iconAnimationController.forward();
                    isSearch ? startNewSearch() : exitSearch();
                  },
                  child: ValueListenableBuilder<bool>(
                      valueListenable: _isSearchIcon,
                      builder:
                          (BuildContext context, bool value, Widget? child) {
                        return Icon(
                          value ? Icons.search : Icons.close,
                        );
                      }),
                ))
          ],
        ),
      ),
    );
  }

  void _submitContent(String value) {
    listSearch
        .add(Searchable(label: value, isSelected: ValueNotifier<bool>(true)));
    streamList.sink.add(listSearch);
    _isSearchIcon.value = true;
    _moveScrollToStart();
  }

  void _moveScrollToEnd() {
    isSearch = !isSearch;
    new Future.delayed(Duration(seconds: 0), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 850), curve: Curves.ease);
    });
  }

  void _moveScrollToStart() {
    isSearch = !isSearch;
    new Future.delayed(Duration(seconds: 0), () {
      _scrollController
          .animateTo(_scrollController.position.minScrollExtent,
              duration: Duration(milliseconds: 850), curve: Curves.ease)
          .whenComplete(() => clearInputField());
    });
  }

  clearInputField() {
    _inputController.text = '';
  }

  void removeItem(Searchable e) {
    listSearch.remove(e);
    streamList.sink.add(listSearch);
  }

  startNewSearch() {
    _isSearchIcon.value = false;
    focusNode.requestFocus();
    _moveScrollToEnd();
  }

  exitSearch() {
    _isSearchIcon.value = true;
    focusNode.unfocus();
    _moveScrollToStart();
  }
}
