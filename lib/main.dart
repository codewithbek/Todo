import 'export_files.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  final hiveService = HiveService();
  await hiveService.openbox();
  runApp(const ToDoApp());
}
