
import 'package:flutter/material.dart';
import 'package:multi_search_flutter/multi_search_flutter.dart';
import 'package:multi_search_flutter/search_indicator_style_enum.dart';

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
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          MultiSearchView(
            searchIndicatorStyle: SearchIndicatorStyle.dot,
            onSelectItem: (value) {
              print(value);
            },
            onSearchComplete: (value) {
              print(value);
            },
            onDeleteAlternative: (value) {
              print(value);
            },
            onItemChanged: (value) {
              print(' on changed $value');
            },
          )
        ],
      ),
    );
  }
}
