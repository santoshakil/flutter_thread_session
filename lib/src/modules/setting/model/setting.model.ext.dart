part of 'setting.model.dart';

extension SettingExtension on AppSetting {
  AppSetting copyWith({bool? firstRun, ThemeProfile? theme}) => AppSetting()
    ..firstRun = firstRun ?? this.firstRun
    ..theme = theme ?? this.theme;
}
