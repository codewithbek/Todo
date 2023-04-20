import 'package:flutter/cupertino.dart';
import 'package:todo/export_files.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return customPageRoute(const SplashView());
      case RouteNames.fullView:
        return customPageRoute(const FullView());
      case RouteNames.home:
        return customPageRoute(const HomeView());

      default:
        return null;
    }
  }

  customPageRoute(Widget child) {
    return CupertinoPageRoute(
      builder: (context) => child,
    );
  }
}
