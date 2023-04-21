import 'package:todo/data/models/todo_model.dart';
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

  Future<void> addTasks(Box box, TodoModel todoModel) async {
    await box.add(todoModel);
  }

  Future<void> deleteTasks(Box box) async {
    await box.clear();
  }
}
