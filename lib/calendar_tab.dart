import 'package:flutter/cupertino.dart';

class CalendarTab extends StatefulWidget {
  @override
  _CalendarTabState createState() {
    return _CalendarTabState();
  }
}

class _CalendarTabState extends State<CalendarTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Calendar'),
        ),
      ],
    );
  }
}
