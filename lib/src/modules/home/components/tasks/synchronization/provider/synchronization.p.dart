import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../compute/provider/compute.p.dart';

Future<void> testIsolate() async {
  final jsonData = await rootBundle.loadString('data/json/csc.json');
  final dir = await getApplicationDocumentsDirectory();
  await Isolate.spawn(
    heavyTask1,
    [jsonData, dir.path],
  );
}
