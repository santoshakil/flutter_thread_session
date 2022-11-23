import 'dart:convert' show json;

import 'package:flutter/material.dart' show ThemeData;
import 'package:isar/isar.dart';

import '../../../theme/model/theme.model.dart';

part 'setting_model.g.dart';

@Collection()
class AppConfig {
  final Id id = 0;
  final bool firstRun;
  final int themeIndex;

  AppConfig({this.firstRun = true, this.themeIndex = 0});

  Map<String, dynamic> toMap() => {
        'themeIndex': themeIndex,
        'firstRun': firstRun,
        'id': id,
      };

  factory AppConfig.fromMap(Map<String, dynamic> map) => AppConfig(
        themeIndex: map['themeIndex']?.toInt() ?? 0,
        firstRun: map['firstRun'] ?? false,
      );

  String toJson() => json.encode(toMap());

  factory AppConfig.fromJson(String source) =>
      AppConfig.fromMap(json.decode(source));

  @override
  String toString() => toJson();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppConfig && other.id == id;
  }

  @Ignore()
  @override
  int get hashCode => id.hashCode;

  AppConfig copyWith({int? id, bool? firstRun, int? themeIndex}) => AppConfig(
        themeIndex: themeIndex ?? this.themeIndex,
        firstRun: firstRun ?? this.firstRun,
      );
}

extension AppConfigExtension on AppConfig {
  ThemeData get theme => SelectedTheme.values[themeIndex].theme;
}
