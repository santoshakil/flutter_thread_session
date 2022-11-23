import '../../../../db/isar.dart' show db;
import '../../model/setting_model.dart';

AppConfig get appConfig => db.appConfigs.getSync(0) ?? AppConfig();
