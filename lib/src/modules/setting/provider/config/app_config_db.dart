import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:isar/isar.dart' show Isar;

import '../../../../utils/paths/paths.dart' show appDBDir;
import '../../model/setting_model.dart'
    show AppConfig, AppConfigSchema, GetAppConfigCollection;

late final Isar appConfigDB;

AppConfig get appConfig => appConfigDB.appConfigs.getSync(0) ?? AppConfig();

Future<void> openAppConfigDB() async => appConfigDB = await Isar.open(
      [AppConfigSchema],
      inspector: !kReleaseMode,
      directory: appDBDir.path,
    );
