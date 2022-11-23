import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:isar/isar.dart' show Isar;

import '../modules/setting/model/setting_model.dart' show AppConfigSchema;
import 'paths.dart' show appDBDir, initDir;

late final Isar db;

Future<void> openDB() async {
  await initDir();
  db = await Isar.open(
    [AppConfigSchema],
    inspector: !kReleaseMode,
    directory: appDBDir.path,
  );
}
