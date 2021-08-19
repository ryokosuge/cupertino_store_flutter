import 'package:cupertino_store_flutter/app.dart';
import 'package:cupertino_store_flutter/state/app_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (_) => AppStateModel()..loadProducts(),
      child: CupertinoStoreApp(),
    ),
  );
}
