import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../extensions/extensions.dart';
import '../../setting/view/setting.view.dart';
import '../components/task/model/task.m.dart';
import '../components/task/view/task.v.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async => await context.push(const SettingView()),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: ListView(
        children: [
          for (final thread in Tasks.values)
            _Tile(key: ValueKey(thread), task: thread),
        ],
      ),
    );
  }
}

class _Tile extends ConsumerWidget {
  const _Tile({super.key, required this.task});

  final Tasks task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18.0),
          onTap: () async => await context.push(TaskView(task: task)),
        ),
      ),
    );
  }
}
