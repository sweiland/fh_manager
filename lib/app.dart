import 'package:flutter/cupertino.dart';
import 'styles.dart';

class CupertinoManageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoManageHomePage(),
    );
  }
}

class CupertinoManageHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('FH Manager'),
      ),
      child: Container(),
    );
  }
}