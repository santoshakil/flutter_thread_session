import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../extensions/extensions.dart';
import '../../setting/view/setting.view.dart';
import '../components/compute/view/task1.v.dart';
import '../model/home.m.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for (final thread in Threads.values)
              _Tile(key: ValueKey(thread), thread: thread),
          ],
        ),
      ),
    );
  }
}

class _Tile extends ConsumerWidget {
  const _Tile({super.key, required this.thread});

  final Threads thread;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: ListTile(
        onTap: () async => await context.push(Task1View(thread)),
        tileColor: context.theme.colorScheme.secondaryContainer,
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        title: Text(thread.title),
      ),
    );
  }
}
