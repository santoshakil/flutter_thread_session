import 'package:flutter/material.dart';

import '../themes.dart';

ThemeData get darkTheme => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorSchemeSeed: Colors.teal,
      brightness: Brightness.dark,
      useMaterial3: true,
      listTileTheme: listTileTheme,
    );
