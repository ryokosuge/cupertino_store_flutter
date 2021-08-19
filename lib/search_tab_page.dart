import 'package:cupertino_store_flutter/product_row_item.dart';
import 'package:cupertino_store_flutter/search_bar.dart';
import 'package:cupertino_store_flutter/state/app_state_model.dart';
import 'package:cupertino_store_flutter/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchTabPage extends StatefulWidget {
  const SearchTabPage({Key? key}) : super(key: key);

  @override
  _SearchTabPageState createState() => _SearchTabPageState();
}

class _SearchTabPageState extends State<SearchTabPage> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  String _terms = '';

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  @override
  void initState() {
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    final results = model.search(_terms);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Styles.scaffoldBackground,
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _buildSearchBox(),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) => ProductRowItem(
                  product: results[index],
                  lastItem: index == results.length - 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
