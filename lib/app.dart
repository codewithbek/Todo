import 'export_files.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context, child) {
        return MaterialApp(
          title: 'To Do app for Udevs',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: OnBoardingView(),
        );
      },
    );
  }
}
