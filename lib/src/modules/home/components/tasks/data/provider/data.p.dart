import 'dart:isolate';

import 'package:flutter_thread_seasion/src/db/isar.dart';
import 'package:synchronized/synchronized.dart';

import '../../../../model/csc.m.dart';

final receivePort = ReceivePort();
late SendPort sendPort;
final lock = Lock();

Future<void> dataSharing() async {
  final isolate = await Isolate.spawn(_isolate, [receivePort.sendPort]);

  isolate.addOnExitListener(receivePort.sendPort, response: 'Exit');

  receivePort.listen((message) {
    print('Main Thread: $message');
    if (message is SendPort) sendPort = message;
  });
}

void _isolate(v) {
  sendPort = v[0] as SendPort;
  sendPort.send(receivePort.sendPort);

  openDBSync();

  receivePort.listen((message) {
    lock.synchronized(() {
      if (message is CSC) {
        db.writeTxnSync(() => db.cSCs.putSync(message));
        print('A new csc has been added to the database.');
      } else if (message is Function) {
        message.call();
      } else {
        print('Isolate Thread: $message');
      }
    });
  });
}
