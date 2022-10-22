import '../../model/setting_model.dart' show GetAppConfigCollection;
import '../config/app_config_db.dart' show appConfig, appConfigDB;

void changeTheme(int index) => appConfigDB.writeTxnSync(
      () => appConfigDB.appConfigs.putSync(
        appConfig.copyWith(themeIndex: index),
      ),
    );
