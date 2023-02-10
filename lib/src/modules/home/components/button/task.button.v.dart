import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../task/model/task.m.dart';
import 'provider/task.button.p.dart';

class TaskButton extends ConsumerWidget {
  const TaskButton({super.key, required this.task, this.onTap});

  final FutureOr Function()? onTap;
  final Tasks task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final running = ref.watch(homeTileProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: running != null
            ? null
            : () async {
                if (onTap == null) return;
                ref.read(homeTileProvider.notifier).state = task;
                await onTap!.call();
                ref.read(homeTileProvider.notifier).state = null;
              },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            running == task
                ? Text('Running ${task.title}')
                : Text('Run ${task.title}'),
            if (running == task) ...[
              const SizedBox(width: 10),
              const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
