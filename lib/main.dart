import 'package:flutter/material.dart' show runApp;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

import 'src/app.dart' show MyApp;
import 'src/db/isar.dart' show openDB;

void main() async {
  await openDB();
  runApp(const ProviderScope(child: MyApp()));
}
