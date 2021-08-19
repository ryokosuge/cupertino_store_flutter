import 'package:cupertino_store_flutter/product_row_item.dart';
import 'package:cupertino_store_flutter/state/app_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductListTabPage extends StatelessWidget {
  const ProductListTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (context, model, child) {
        final products = model.getProducts();
        return CustomScrollView(
          semanticChildCount: products.length,
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text('Cupertino Store'),
            ),
            SliverSafeArea(
              top: false,
              minimum: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (products.length <= index) {
                      return null;
                    }
                    return ProductRowItem(
                      product: products[index],
                      lastItem: index == products.length - 1,
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
