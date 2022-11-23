part of 'theme.model.dart';

extension SelectedThemeExtension on SelectedTheme {
  ThemeData get theme {
    switch (this) {
      case SelectedTheme.light:
        return lightTheme;
      case SelectedTheme.dark:
        return darkTheme;
    }
  }
}
