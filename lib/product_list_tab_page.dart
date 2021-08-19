import 'package:cupertino_store_flutter/state/app_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductListTabPage extends StatelessWidget {
  const ProductListTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        return const CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Cupertino Store'),
            ),
          ],
        );
      },
    );
  }
}
