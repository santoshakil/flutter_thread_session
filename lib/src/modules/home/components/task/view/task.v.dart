import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../button/task.button.v.dart';
import '../model/task.m.dart';

class TaskView extends ConsumerWidget {
  const TaskView({super.key, required this.task, this.onTap});

  final FutureOr Function()? onTap;
  final Tasks task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TaskButton(
              thread: task,
              onTap: () async {
                await Future.delayed(const Duration(seconds: 100));
              },
            ),
            const SizedBox(height: 10),
            Expanded(child: task.view),
          ],
        ),
      ),
    );
  }
}
