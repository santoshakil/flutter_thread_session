import 'dart:io';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:flutter_thread_seasion/src/modules/home/components/tasks/compute/provider/compute.p.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../db/isar.dart';
import '../../../../model/csc.m.dart';

Future<void> testIsolate() async {
  final jsonData = await rootBundle.loadString('data/json/csc.json');
  final dir = await getApplicationDocumentsDirectory();
  await Isolate.spawn(
    heavyTask1,
    [jsonData, dir.path],
  );
}

Future<void> runIsolate() async {
  final token = ServicesBinding.rootIsolateToken!;
  await Isolate.spawn(
    (v) async {
      BackgroundIsolateBinaryMessenger.ensureInitialized(
        v.last as RootIsolateToken,
      );
      openDBSync();
      final csc = cscFromJson(v.first as String);
      final cscNew =
          csc.map((e) => e.copyWith(dataID: e.dataID ?? 250 + 1)).toList();
      final dir = await getApplicationDocumentsDirectory();
      final file = File(join(dir.path, 'csc.json'));
      file.writeAsStringSync(cscToJson(cscNew));
      file.deleteSync();
      print(cscNew.length);
      final start = DateTime.now().millisecondsSinceEpoch;
      db.writeTxnSync(() => db.cSCs.putAllSync(cscNew));
      final end = DateTime.now().millisecondsSinceEpoch;
      print('Time taken: ${end - start}');
      db.writeTxnSync(() => db.clearSync());
      final end2 = DateTime.now().millisecondsSinceEpoch;
      print('Time taken: ${end2 - end}');
    },
    [await rootBundle.loadString('data/json/csc.json'), token],
  );
}
