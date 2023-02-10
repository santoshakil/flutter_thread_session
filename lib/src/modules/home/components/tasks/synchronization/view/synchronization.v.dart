import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synchronized/synchronized.dart';

import '../../../button/task.button.v.dart';
import '../../../task/model/task.m.dart';
import '../provider/synchronization.p.dart';

final lock = Lock();

class SynchronizationView extends ConsumerWidget {
  const SynchronizationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TaskButton(
          task: Tasks.synchronization,
          onTap: () async => await lock.synchronized(testIsolate),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
