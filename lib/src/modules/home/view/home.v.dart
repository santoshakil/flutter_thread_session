import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../setting/view/setting.view.dart';
import '../components/task1/view/task1.v.dart';

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
          children: const [
            Task1View(),
          ],
        ),
      ),
    );
  }
}
