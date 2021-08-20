import 'package:cupertino_store_flutter/state/app_state_model.dart';
import 'package:cupertino_store_flutter/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:cupertino_store_flutter/model/product.dart';

class ProductRowItem extends StatelessWidget {
  final Product product;
  final bool lastItem;

  const ProductRowItem({
    Key? key,
    required this.product,
    required this.lastItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
        right: 8,
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.cover,
              width: 76,
              height: 76,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: Styles.productRowItemName,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: Styles.productRowItemPrice,
                  ),
                ],
              ),
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              final model = Provider.of<AppStateModel>(
                context,
                listen: false,
              );
              model.addProductToCart(product.id);
            },
            child: const Icon(
              CupertinoIcons.plus_circle,
              semanticLabel: 'Add',
            ),
          ),
        ],
      ),
    );

    if (lastItem) {
      return row;
    }

    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: Styles.productRowDivider,
          ),
        ),
      ],
    );
  }
}
