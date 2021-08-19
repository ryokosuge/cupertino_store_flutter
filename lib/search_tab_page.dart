import 'package:flutter/cupertino.dart';

class SearchTabPage extends StatefulWidget {
  const SearchTabPage({Key? key}) : super(key: key);

  @override
  _SearchTabPageState createState() => _SearchTabPageState();
}

class _SearchTabPageState extends State<SearchTabPage> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Search'),
        )
      ],
    );
  }
}
