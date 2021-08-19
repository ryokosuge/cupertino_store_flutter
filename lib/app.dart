import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoStoreApp extends StatelessWidget {
  const CupertinoStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return CupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  const CupertinoStoreHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Cupertino Store'),
      ),
      child: SizedBox(),
    );
  }
}
