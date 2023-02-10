import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../model/csc.m.dart';

String? testString;

Future<void> testCompute() async {
  final jsonData = await rootBundle.loadString('data/json/csc.json');
  final dir = await getApplicationDocumentsDirectory();
  await compute(_heavyTask, [jsonData, dir.path]);
}

Future<void> _heavyTask(List v) async {
  final decoded = cscFromJson(v.first as String);
  final modified =
      decoded.map((e) => e.copyWith(name: e.name?.toUpperCase())).toList();
  final modified2 =
      modified.map((e) => e.copyWith(name: e.name?.toLowerCase())).toList();
  final dir = v.last as String;
  final file = File(join(dir, 'csc.json'));
  file.writeAsStringSync(cscToJson(modified2));
  file.deleteSync();
  print('File deleted: ${file.existsSync()}');
}
