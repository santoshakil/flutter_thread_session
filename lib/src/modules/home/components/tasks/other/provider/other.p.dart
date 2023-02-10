import 'dart:isolate';

import 'package:flutter/foundation.dart';

// 1. Compute
Future<List<int>> calculateSumOfSquares(List<int> numbers) async {
  return await compute(sumOfSquares, numbers);
}

List<int> sumOfSquares(List<int> numbers) {
  return numbers.map((number) => number * number).toList();
}

// 2. Isolate
Future<void> performLongTask() async {
  ReceivePort receivePort = ReceivePort();
  final isolate = await Isolate.spawn(longTask, receivePort.sendPort);
  await for (final message in receivePort) {
    if (message is SendPort) {
      message.send('Hello from main isolate');
    } else {
      print(message);
    }
    if (message == 'Iteration 999') {
      receivePort.close();
      isolate.kill();
    }
  }
}

void longTask(SendPort sendPort) {
  for (int i = 0; i < 1000; i++) {
    String message = 'Iteration $i';
    sendPort.send(message);
  }
}
