import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/model/theme.model.dart';
import '../../../theme/provider/theme.provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Consumer(
          builder: (_, ref, __) {
            final theme = ref.watch(themeProvider);
            return ElevatedButton(
              onPressed: () async =>
                  await ref.read(themeProvider.notifier).toggleTheme(),
              child: theme == ThemeProfile.dark
                  ? const Text('Change Theme to Light')
                  : const Text('Change Theme to Dark'),
            );
          },
        ),
      ),
    );
  }
}
