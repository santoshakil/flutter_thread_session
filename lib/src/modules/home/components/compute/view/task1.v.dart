import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/home.m.dart';
import '../../button/task.button.v.dart';

class Task1View extends ConsumerWidget {
  const Task1View(this.thread, {Key? key}) : super(key: key);
  final Threads thread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(thread.title)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TaskButton(
              thread: thread,
              onTap: () async {
                await Future.delayed(const Duration(seconds: 100));
              },
            ),
          ],
        ),
      ),
    );
  }
}
