import 'package:FH_Manager/component/todo_badge.dart';
import 'package:FH_Manager/model/hero_id_model.dart';
import 'package:FH_Manager/model/task_model.dart';
import 'package:FH_Manager/scopedmodel/todo_list_model.dart';
import 'package:FH_Manager/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class AddTodoScreen extends StatefulWidget {
  final String taskId;
  final HeroId heroIds;

  AddTodoScreen({
    @required this.taskId,
    @required this.heroIds,
  });

  @override
  State<StatefulWidget> createState() {
    return _AddTodoScreenState();
  }
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  String newTask;
  String description;
  String dueDate;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      newTask = '';
      description = '';
      dueDate = DateTime.now().toIso8601String();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TodoListModel>(
      builder: (BuildContext context, Widget child, TodoListModel model) {
        if (model.tasks.isEmpty) {
          // Loading
          return Container(
            color: Colors.white,
          );
        }

        var _task = model.tasks.firstWhere((it) => it.id == widget.taskId);
        var _color = ColorUtils.getColorFrom(id: _task.color);
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'New Task',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black26),
            brightness: Brightness.light,
            backgroundColor: Colors.white,
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What Task do you have to do?',
                  style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
                Container(
                  height: 16.0,
                ),
                TextField(
                  onChanged: (text) {
                    setState(() => newTask = text);
                  },
                  cursorColor: _color,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Task Name',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      )),
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 36.0),
                ),
                TextField(
                  onChanged: (text) {
                    setState(() => description = text);
                  },
                  cursorColor: _color,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      )),
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0),
                ),
                TextField(
                  onChanged: (text) {
                    setState(() => dueDate = text);
                  },
                  cursorColor: _color,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Due Date and Time',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      )),
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0),
                ),
                Container(
                  height: 26.0,
                ),
                Row(
                  children: [
                    TodoBadge(
                      codePoint: _task.codePoint,
                      color: _color,
                      id: widget.heroIds.codePointId,
                      size: 20.0,
                    ),
                    Container(
                      width: 16.0,
                    ),
                    Hero(
                      child: Text(
                        _task.name,
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      tag: "not_using_right_now", //widget.heroIds.titleId,
                    ),
                  ],
                )
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(
            builder: (BuildContext context) {
              return FloatingActionButton.extended(
                heroTag: 'fab_new_task',
                icon: Icon(Icons.add),
                backgroundColor: _color,
                label: Text('Add Task'),
                onPressed: () {
                  if (newTask.isEmpty) {
                    final snackBar = SnackBar(
                      content:
                          Text('Please provide at least a name for you Task!'),
                      backgroundColor: _color,
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                    // _scaffoldKey.currentState.showSnackBar(snackBar);
                  } else {
                    model.addTodo(Task(
                      newTask,
                      description: description,
                      dueDate: dueDate,
                      parent: _task.id,
                    ));
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}

// Reason for wraping fab with builder (to get scafold context)
// https://stackoverflow.com/a/52123080/4934757
