part of '../extensions.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);

  Size get size => mediaQuery.size;
  double get height => size.height;
  double get width => size.width;

  double get personalInfoTextFieldMinimumWidth => 500;

  double get personalInfoTextFieldSmallMinimumWidth => 245;

  bool get tooSmall => width < 350 || height < 500;

  TextTheme get text => theme.textTheme;

  Future<T?> push<T>(Widget page) =>
      Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushReplacement<T>(Widget page) => Navigator.of(this)
      .pushReplacement<T, T?>(MaterialPageRoute(builder: (_) => page));

  Future<T?> pushAndRemoveUntil<T>(Widget page) =>
      Navigator.of(this).pushAndRemoveUntil<T>(
          MaterialPageRoute(builder: (_) => page), (_) => false);

  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  bool get isAndroid => theme.platform == TargetPlatform.android;
  bool get isIOS => theme.platform == TargetPlatform.iOS;
  bool get isWindows => theme.platform == TargetPlatform.windows;
  bool get isLinux => theme.platform == TargetPlatform.linux;
  bool get isMacOS => theme.platform == TargetPlatform.macOS;
  bool get isDesktop => isWindows || isLinux || isMacOS;
  bool get isMobile => isAndroid || isIOS;
}
