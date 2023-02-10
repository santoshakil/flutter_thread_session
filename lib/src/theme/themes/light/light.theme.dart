import 'package:flutter/material.dart';

import '../themes.dart';

ThemeData get lightTheme => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorSchemeSeed: Colors.teal,
      brightness: Brightness.light,
      useMaterial3: true,
      listTileTheme: listTileTheme,
    );
