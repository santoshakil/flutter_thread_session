import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/db/isar.dart';
import 'package:pattern_m/src/db/paths.dart';
import 'package:pattern_m/src/modules/setting/model/setting.model.dart';

import '../../modules/setting/provider/settings.provider.dart';
import '../model/theme.model.dart';

typedef ThemeNotifier = NotifierProvider<ThemeProvider, ThemeProfile>;
final themeProvider = ThemeNotifier(ThemeProvider.new);

class ThemeProvider extends Notifier<ThemeProfile> {
  @override
  ThemeProfile build() => ref.watch(settingsProvider.select((v) => v.theme));

  ThemeProfile get theme => state;
  _Data get _data => _Data(ref.read(settingsProvider), state);

  void changeTheme(ThemeProfile theme) async =>
      await compute(_changeTheme, _data);

  void _changeTheme(_Data data) {
    openDBSync(data.dir);
    data.setting.theme = data.theme;
    db.writeTxnSync(() => db.appSettings.putSync(data.setting));
  }

  void toggleTheme() => changeTheme(state.toggled);
}

class _Data {
  _Data(this.setting, this.theme);

  final AppDir dir = appDir;
  final ThemeProfile theme;
  final AppSetting setting;
}
