import 'dart:io' show Directory;

import 'package:flutter/material.dart' show WidgetsFlutterBinding;
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import '../constants/constants.dart' show appName;
import '../utils/log/log.dart' show log;

final appDir = AppDir();

Future<void> initDir() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  appDir.root = Directory(join(dir.path, '.${appName.toLowerCase()}'));
  appDir.db = Directory(join(appDir.root.path, 'db'));
  appDir.backup = Directory(join(appDir.root.path, 'backup'));
  if (!appDir.root.existsSync()) appDir.root.createSync(recursive: true);
  if (!appDir.db.existsSync()) appDir.db.createSync(recursive: true);
  if (!appDir.backup.existsSync()) appDir.backup.createSync(recursive: true);
  log.i('App Directory: ${appDir.root.path}');
}

class AppDir {
  late Directory backup;
  late Directory root;
  late Directory db;
  AppDir();
}
