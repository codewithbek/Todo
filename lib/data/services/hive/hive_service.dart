import 'package:todo/export_files.dart';

class HiveService {
  Box<TodoModel>? todos;

  Future<Box<TodoModel>> openbox() async {
    todos ??= await Hive.openBox<TodoModel>("todos");
    return todos!;
  }

  TodoModel getTaskById(Box box, int id) {
    return box.get(id);
  }

  List<TodoModel> getTasks(
    Box box,
  ) {
    List<TodoModel> values = box.values.toList().cast<TodoModel>();
    values.sort((a, b) => a.dateTime.millisecondsSinceEpoch
        .compareTo(b.dateTime.millisecondsSinceEpoch));
    return values;
  }

  Future<void> addTasks(Box box, TodoModel todo) async {
    await box.put(todo.id, todo);
  }

  Future<void> deleteTaskById(Box box, int id) async {
    await box.delete(id);
  }

  Future<void> updateTask(Box box, TodoModel todo) async {
    await box.put(todo.id, todo);
  }

  Future<void> deleteAllTasks(Box box) async {
    await box.clear();
  }
}
