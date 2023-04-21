import 'package:todo/export_files.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late int categoryId;
  @HiveField(2)
  late String title;
  @HiveField(3)
  late DateTime dateTime;
  @HiveField(4)
  late bool isDone;
}
