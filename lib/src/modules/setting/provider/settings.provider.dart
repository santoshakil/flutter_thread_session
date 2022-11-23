import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../db/isar.dart';
import '../model/setting.model.dart';

final _settingsStream = db.appSettings.watchObject(0, fireImmediately: true);
final _settingsStreamProvider = StreamProvider((_) => _settingsStream);

typedef AppSettingsNotifier = NotifierProvider<SettingProvider, AppSetting>;
final settingsProvider = AppSettingsNotifier(SettingProvider.new);

class SettingProvider extends Notifier<AppSetting> {
  @override
  AppSetting build() =>
      ref.watch(_settingsStreamProvider).value ?? AppSetting();
}
