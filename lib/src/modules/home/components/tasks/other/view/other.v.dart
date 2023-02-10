import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../button/task.button.v.dart';
import '../../../task/model/task.m.dart';
import '../provider/other.p.dart';

class OtherView extends ConsumerWidget {
  const OtherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TaskButton(
          task: Tasks.other,
          onTap: () async {
            await performLongTask();
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
