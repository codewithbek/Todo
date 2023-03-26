import 'package:todo/export_files.dart';

class AppRoutes {
  static String splash = "/";
  static String fullView = "/fullView";

  static String home = "/home";
  static String tasks = "/tasks";
  static String getSplashRoute() => splash;
  static String getHomeRoute() => home;
  static String getBottomeBar() => fullView;
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: fullView,
      page: () => FullView(),
    ),
    GetPage(
      name: home,
      page: () => HomeView(),
    ),
  ];
}
