import 'package:flutter/material.dart' show runApp;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'src/app.dart' show MyApp;
import 'src/modules/setting/provider/config/app_config_db.dart'
    show openAppConfigDB;
import 'src/utils/helpers/other/other_helper.dart' show log;
import 'src/utils/paths/paths.dart' show appDir, initDir;

void main() async {
  await initDir();
  log.i('App Directory: ${appDir.path}');
  await openAppConfigDB();
  runApp(const ProviderScope(child: MyApp()));
}
