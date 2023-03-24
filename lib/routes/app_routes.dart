import 'package:todo/export_files.dart';

class AppRoutes {
  static String splash = "/";
  static String bottomBar = "/bottomBar";

  static String home = "/home";
  static String tasks = "/tasks";
  static String getSplashRoute() => splash;
  static String getHomeRoute() => home;
  static String getBottomeBar() => bottomBar;
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: bottomBar,
      page: () => BottomBarView(),
    ),
    GetPage(
      name: home,
      page: () => HomeView(),
    ),
  ];
}
