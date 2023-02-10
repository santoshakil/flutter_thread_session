import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../button/task.button.v.dart';
import '../../../task/model/task.m.dart';
import '../provider/compute.p.dart';

class ComputeView extends ConsumerWidget {
  const ComputeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TaskButton(
          task: Tasks.compute,
          onTap: () async {
            testString = 'Hello World';
            await testCompute();
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
