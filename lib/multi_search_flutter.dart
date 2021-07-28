library multi_search_flutter;
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_search_flutter/search_item.dart';
import 'package:multi_search_flutter/searchable.dart';

class MultiSearchView extends StatefulWidget {
  const MultiSearchView({Key? key}) : super(key: key);

  @override
  _MultiSearchViewState createState() => _MultiSearchViewState();
}

class _MultiSearchViewState extends State<MultiSearchView> with TickerProviderStateMixin {
  var showInput;
  late AnimationController _iconAnimationController;
  late StreamController<List<Searchable>> _streamList;
  late ScrollController _scrollController;
  var listSearch = <Searchable>[];
  late TextEditingController _inputController;
  late FocusNode _focusNode;
  bool isSearch = true;
  final ValueNotifier<bool> _isSearchIcon = ValueNotifier<bool>(true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamList = StreamController<List<Searchable>>();
    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _scrollController = new ScrollController();
    _inputController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                controller: _scrollController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 60,
                    child: StreamBuilder(
                        stream: _streamList.stream,
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
                                    e.isSelected),
                                onDelete: () {
                                  removeItem(e);
                                },
                                onSelect: (data) {
                                  selectItem(e);
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
                      width: MediaQuery.of(context).size.width - 60,
                      child: new TextField(
                          controller: _inputController,
                          onSubmitted: _submitContent,
                          focusNode: _focusNode,
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
              height: 60,
              width: 60,
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
              ),
            )
          ],
        );
  }

  Future<void> _submitContent(String value) async {
    await resetItemIndicator();
    listSearch
        .add(Searchable(label: value, isSelected: ValueNotifier<bool>(true)));
    _streamList.sink.add(listSearch);
    _isSearchIcon.value = true;
    _moveScrollToStart();
  }

  Future<void> resetItemIndicator() async {
    listSearch.forEach((e) {
      if (e.isSelected?.value == true) {
        e.isSelected?.value = false;
      }
    });
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
    _streamList.sink.add(listSearch);
  }

  startNewSearch() {
    _isSearchIcon.value = false;
    _focusNode.requestFocus();
    _moveScrollToEnd();
  }

  exitSearch() {
    _isSearchIcon.value = true;
    _focusNode.unfocus();
    _moveScrollToStart();
  }

  Future<void> selectItem(Searchable e) async {
    await resetItemIndicator();
    listSearch.firstWhere((item) {
      return e == item;
    })
      ..isSelected = ValueNotifier<bool>(true);
    _streamList.sink.add(listSearch);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamList.sink.close();
    _iconAnimationController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
  }
}


