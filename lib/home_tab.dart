import 'package:fh_manager/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var tasks = Provider
        .of<DataBase>(context)
        .colorDao
        .allColors;
    return CustomScrollView(slivers: <Widget>[
      CupertinoSliverNavigationBar(
        largeTitle: Text('FH Manager'),
      ),
      SliverSafeArea(
        top: false,
        minimum: const EdgeInsets.only(top: 8),
        sliver: SliverList(
          delegate: SliverChildListDelegate([
            Container(
                child: FutureBuilder(
                  future: tasks,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(itemBuilder: (context, index) {
                      return snapshot.data[index].entry;
                    })
                        : Center(
                      child: CupertinoActivityIndicator(),
                    );
                  },
                ))
          ]),
        ),
      ),
    ]);
  }
}
