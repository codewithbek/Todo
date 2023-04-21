import 'package:todo/export_files.dart';

class TodoRepository {
  TodoRepository({required HiveService hiveService})
      : _hiveService = hiveService;
  final HiveService _hiveService;

  Future<void> addTasks(TodoModel todoModel) async {
    var box = await _hiveService.openbox();
    await _hiveService.addTasks(box, todoModel);
  }

  Future<void> deleteTaskById(int id) async {
    var box = await _hiveService.openbox();
    await _hiveService.deleteTaskById(box, id);
  }

  Future<List<TodoModel>> getTasks() async {
    var box = await _hiveService.openbox();
    return _hiveService.getTasks(box);
  }
}
