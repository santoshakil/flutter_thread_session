import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/model/theme.model.dart';
import '../../../theme/provider/theme.provider.dart';
import '../../../theme/themes/themes.dart';

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
              style: roundedButtonStyle,
              onPressed: () async =>
                  await ref.read(themeProvider.notifier).toggleTheme(),
              child: theme == ThemeProfile.light
                  ? const Text('Change Theme to Light')
                  : const Text('Change Theme to Dark'),
            );
          },
        ),
      ),
    );
  }
}
