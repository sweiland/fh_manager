import 'package:FH_Manager/component/colorpicker/color_picker_builder.dart';
import 'package:FH_Manager/component/iconpicker/icon_picker_builder.dart';
import 'package:FH_Manager/model/subject_model.dart';
import 'package:FH_Manager/scopedmodel/todo_list_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EditSubjectScreen extends StatefulWidget {
  final String taskId;
  final String taskName;
  final Color color;
  final IconData icon;

  EditSubjectScreen(
      {@required this.taskId,
      @required this.taskName,
      @required this.color,
      @required this.icon});

  @override
  State<StatefulWidget> createState() {
    return _EditCardScreenState();
  }
}

class _EditCardScreenState extends State<EditSubjectScreen> {
  final btnSaveTitle = "Save Changes";
  String newTask;
  Color taskColor;
  IconData taskIcon;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      newTask = widget.taskName;
      taskColor = widget.color;
      taskIcon = widget.icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<TodoListModel>(
      builder: (BuildContext context, Widget child, TodoListModel model) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Edit ' + newTask,
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
                  'Add your subjects here, so you can add Tasks to them.',
                  style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
                Container(
                  height: 16.0,
                ),
                TextFormField(
                  initialValue: newTask,
                  onChanged: (text) {
                    setState(() => newTask = text);
                  },
                  cursorColor: taskColor,
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Subject Name',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                      )),
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 36.0),
                ),
                Container(
                  height: 26.0,
                ),
                Row(
                  children: [
                    ColorPickerBuilder(
                        color: taskColor,
                        onColorChanged: (newColor) =>
                            setState(() => taskColor = newColor)),
                    Container(
                      width: 22.0,
                    ),
                    IconPickerBuilder(
                        iconData: taskIcon,
                        highlightColor: taskColor,
                        action: (newIcon) =>
                            setState(() => taskIcon = newIcon)),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(
            builder: (BuildContext context) {
              return FloatingActionButton.extended(
                heroTag: 'fab_new_card',
                icon: Icon(Icons.save),
                backgroundColor: taskColor,
                label: Text(btnSaveTitle),
                onPressed: () {
                  if (newTask.isEmpty) {
                    final snackBar = SnackBar(
                      content: Text('Please provide a name for your Subject!'),
                      backgroundColor: taskColor,
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                    // _scaffoldKey.currentState.showSnackBar(snackBar);
                  } else {
                    model.updateTask(Subject(newTask,
                        codePoint: taskIcon.codePoint,
                        color: taskColor.value,
                        id: widget.taskId));
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
