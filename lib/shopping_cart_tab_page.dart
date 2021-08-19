import 'package:cupertino_store_flutter/state/app_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ShoppingCartTabPage extends StatefulWidget {
  const ShoppingCartTabPage({Key? key}) : super(key: key);

  @override
  _ShoppingCartTabPageState createState() => _ShoppingCartTabPageState();
}

class _ShoppingCartTabPageState extends State<ShoppingCartTabPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return const CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Shopping Cart'),
            )
          ],
        );
      },
    );
  }
}
