import 'package:intl/intl.dart';
import 'package:todo/export_files.dart';

class TodoRepository {
  TodoRepository({required HiveService hiveService})
      : _hiveService = hiveService;
  final HiveService _hiveService;

  Future<TodoModel> addTask(TodoModel todoModel) async {
    var box = await _hiveService.openbox();
    await _hiveService.addTask(box, todoModel);
    return _hiveService.getTaskById(box, todoModel.id);
  }

  Future<void> deleteTaskById(int id) async {
    var box = await _hiveService.openbox();
    await _hiveService.deleteTaskById(box, id);
  }

  Future<TodoModel> getTaskById(int id) async {
    var box = await _hiveService.openbox();
    return _hiveService.getTaskById(box, id);
  }

  Future<List<TodoModel>> getTasks() async {
    var box = await _hiveService.openbox();
    return _hiveService.getTasks(box);
  }

  Future<void> updateToDo(TodoModel todo) async {
    var box = await _hiveService.openbox();
    await _hiveService.updateTask(box, todo);
  }

 
}
