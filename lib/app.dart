
import 'export_files.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});
  @override
  Widget build(BuildContext context) {
    final hiveService = HiveService();
    return RepositoryProvider(
      create: (context) => CategoryRepository(),
      child: BlocProvider(
        create: (context) => TodoBloc(
          TodoRepository(
            hiveService: hiveService,
          ),
        )..add(GetTodosEvent()),
        child: ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'To Do app for Udevs',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                primarySwatch: Colors.lightBlue,
                colorScheme:
                    ColorScheme.fromSwatch(primarySwatch: Colors.lightBlue),
              ),
              initialRoute: RouteNames.splash,
              onGenerateRoute: AppRouter().onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
