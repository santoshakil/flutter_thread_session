import 'dart:async';
import 'dart:isolate';

Future<void> persistantThread() async {
  final receivePort = ReceivePort();

  final isolate = await Isolate.spawn(
    (sendPort) {
      Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          print('In Secondery Thread: ${timer.tick}');
          sendPort.send(timer.tick);
          if (timer.tick == 5) {
            timer.cancel();
          }
        },
      );
    },
    receivePort.sendPort,
    // onExit: receivePort.sendPort,
  );

  isolate.addOnExitListener(
    receivePort.sendPort,
    response: 'Isolate exited',
  );

  // await for (final message in receivePort) {
  //   print('In Main Thread: $message');
  //   if (message == 10) {
  //     receivePort.close();
  //   }
  // }
  receivePort.listen((message) {
    print('In Main Thread: $message');
    // if (message == 7) {
    //   receivePort.close();
    // }
  });

  print('Done');
}
