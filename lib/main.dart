import 'package:fh_manager/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  // This app is designed only to work vertically, so we limit
  // orientations to portrait up and down.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  return runApp(
    Provider<DataBase>(
        builder: (context) => DataBase(),
        child: CupertinoManageApp(),
        dispose: (context, db) => db.close),
  );
}
