import 'package:flutter/cupertino.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('FH Manager'),
        ),
      ],
    );
  }
}
