import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Provider, StreamProvider;

import '../../model/setting_model.dart'
    show AppConfigExtension, GetAppConfigCollection;
import '../config/app_config_db.dart' show appConfig, appConfigDB;

final themeConfigStream =
    StreamProvider((ref) => appConfigDB.appConfigs.watchObject(0));

final themeProvider = Provider((ref) {
  ref.watch(themeConfigStream);
  return appConfig.theme;
});
