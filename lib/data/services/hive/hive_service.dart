import 'package:todo/export_files.dart';

class HiveService {
  Box<TodoModel>? todos;

  Future<Box<TodoModel>> openbox() async {
    todos ??= await Hive.openBox<TodoModel>("todos");
    return todos!;
  }

  List<TodoModel> getTasks(Box box) {
    return box.values.toList().cast<TodoModel>();
  }

  Future<void> addTasks(Box box, int key, TodoModel todo) async {
    await box.put(key, todo);
  }

  Future<void> deleteTaskById(Box box, int key) async {
    await box.delete(key);
  }

  // Future<void> updateTask(Box box, TodoModel todo ) async {
  //   await box.put(todo);
  // }

  Future<void> deleteAllTasks(Box box) async {
    await box.clear();
  }
}
