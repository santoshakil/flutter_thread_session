import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../model/csc.m.dart';
import '../../../button/task.button.v.dart';
import '../../../task/model/task.m.dart';
import '../provider/data.p.dart';

class DataView extends ConsumerWidget {
  const DataView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TaskButton(
          task: Tasks.data,
          onTap: () async {
            await dataSharing();
          },
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ElevatedButton(
            child: const Text('Send data to isolate'),
            onPressed: () => sendPort.send(
              CSC(name: 'CSC ${DateTime.now()}'),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ElevatedButton(
            child: const Text('Send Function to isolate'),
            onPressed: () => sendPort.send(testFunction),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

void testFunction() => print('Test function: ${DateTime.now()}');
