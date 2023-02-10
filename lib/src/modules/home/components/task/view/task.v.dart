import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/task.m.dart';

class TaskView extends ConsumerWidget {
  const TaskView({super.key, required this.task, this.onTap});

  final FutureOr Function()? onTap;
  final Tasks task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: task.view,
    );
  }
}
