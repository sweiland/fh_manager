import 'package:fh_manager/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:moor_flutter/moor_flutter.dart' as m;
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
    Future<List<TaskData>> tasks =
        Provider.of<DataBase>(context).taskDao.allTasks;
    return CustomScrollView(slivers: <Widget>[
      CupertinoSliverNavigationBar(
        largeTitle: Text('FH Manager'),
      ),
      SliverSafeArea(
        top: false,
        minimum: const EdgeInsets.only(top: 8),
        sliver: SliverList(
          delegate: SliverChildListDelegate([TaskWidget.builder(tasks)]),
        ),
      ),
    ]);
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget(
      {this.name,
      this.description,
      this.importance,
      this.duedate,
      this.subject});

  final String name;
  final String description;
  final double importance;
  final DateTime duedate;
  final int subject;

  Widget builder(Future<List<TaskData>> tasks) {
    Container(
        child: FutureBuilder(
      future: tasks,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? snapshot.data == 0
                ? Provider.of<DataBase>(context).taskDao.createTask(
                    TaskCompanion(
                        name: m.Value('Task'),
                        description: m.Value('xx'),
                        importance: m.Value(5.0),
                        subject: m.Value(1)))
                : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      TaskData task = snapshot.data[index];
                      return Column(
                        children: <Widget>[
                          TaskWidget(
                            name: task.name,
                            description: task.description,
                            importance: task.importance,
                            duedate: task.duedate,
                            subject: task.subject,
                          )
                        ],
                      );
                    },
                  )
            : Center(
                child: CupertinoActivityIndicator(),
              );
      },
    ));
  }

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.name,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  Text(
                    '\$${this.importance}',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

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
          ),
        ),
      ],
    );
  }
}
