import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../db/isar.dart';
import '../../db/paths.dart';
import '../../modules/setting/model/setting.model.dart';
import '../../modules/setting/provider/settings.provider.dart';
import '../model/theme.model.dart';

typedef ThemeNotifier = NotifierProvider<ThemeProvider, ThemeProfile>;
final themeProvider = ThemeNotifier(ThemeProvider.new);

class ThemeProvider extends Notifier<ThemeProfile> {
  @override
  ThemeProfile build() => ref.watch(settingsProvider.select((v) => v.theme));

  ThemeProfile get theme => state;

  Future<void> changeTheme(ThemeProfile theme) async =>
      await compute(_changeTheme, _Data(ref.read(settingsProvider), theme));

  Future<void> toggleTheme() async => await changeTheme(state.toggled);
}

void _changeTheme(_Data data) {
  openDBSync(data.dir);
  data.setting.theme = data.theme;
  db.writeTxnSync(() => db.appSettings.putSync(data.setting));
}

class _Data {
  _Data(this.setting, this.theme);

  final AppDir dir = appDir;
  final ThemeProfile theme;
  final AppSetting setting;
}
