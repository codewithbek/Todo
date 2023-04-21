import 'package:hive/hive.dart';
import 'package:todo/models/todo_model.dart';

class HiveService {
  Box<TodoModel>? todos;

  Future<Box<TodoModel>> openbox() async {
    todos ??=
        await Hive.openBox<TodoModel>("todos");
    return todos!;
  }

  List<TodoModel> getTasks(Box box) {
    return box.values.toList().cast<TodoModel>();
  }

  Future<void> addTasks(Box box, TodoModel cachedPrayerModel) async {
    await box.add(cachedPrayerModel);
  }

  Future<void> deleteTasks(Box box) async {
    await box.clear();
  }
}
