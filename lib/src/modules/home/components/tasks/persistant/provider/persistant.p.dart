import 'dart:async';
import 'dart:isolate';

Future<void> persistantThread() async {
  final receivePort = ReceivePort();

  await Isolate.spawn(
    (sendPort) {
      Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          print('In Secondery Thread: ${DateTime.now()}');
          sendPort.send('${DateTime.now()}');
        },
      );
    },
    receivePort.sendPort,
  );

  await for (final message in receivePort) {
    print('In Main Thread: $message');
  }
}
