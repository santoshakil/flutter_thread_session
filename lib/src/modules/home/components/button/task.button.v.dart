import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../task/model/task.m.dart';
import 'provider/task.button.p.dart';

class TaskButton extends ConsumerWidget {
  const TaskButton({super.key, required this.thread, this.onTap});

  final FutureOr Function()? onTap;
  final Tasks thread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final running = ref.watch(homeTileProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: ElevatedButton(
        onPressed: running != null
            ? null
            : () async {
                if (onTap == null) return;
                ref.read(homeTileProvider.notifier).state = thread;
                await onTap!.call();
                ref.read(homeTileProvider.notifier).state = null;
              },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            running == thread
                ? Text('Running ${thread.title}')
                : Text('Run ${thread.title}'),
            if (running == thread) ...[
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
