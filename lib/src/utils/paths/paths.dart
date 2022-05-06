import 'dart:io' show Directory;

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import '../../configs/configs.dart' show appName;

late Directory appDir;
late Directory appDBDir;
late Directory appBackupDir;

Future<void> initDir() async {
  final _dir = await getApplicationDocumentsDirectory();
  appDir = Directory(join(_dir.path, '.${appName.toLowerCase()}'));
  appDBDir = Directory(join(appDir.path, 'db'));
  appBackupDir = Directory(join(appDir.path, 'backup'));
  if (!appDir.existsSync()) appDir.createSync(recursive: true);
  if (!appDBDir.existsSync()) appDBDir.createSync(recursive: true);
  if (!appBackupDir.existsSync()) appBackupDir.createSync(recursive: true);
}
