import 'package:todo/export_files.dart';

class CategoryModel {
  CategoryModel({
    required this.iconPath,
    required this.taskCount,
    required this.title,
    required this.color,
    required this.id,
  });
  final String iconPath;
  final String title;
  final String taskCount;
  final Color color;
  final int id;
  static List<CategoryModel> categories = [
    CategoryModel(
        id: 0,
        color: AppColors.cFFEE9B.withOpacity(0.36),
        iconPath: Assets.personal,
        taskCount: "24",
        title: "Personal"),
    CategoryModel(
        id: 1,
        color: AppColors.cB5FF9B.withOpacity(0.36),
        iconPath: Assets.work,
        taskCount: "44",
        title: "Work"),
    CategoryModel(
        id: 2,
        color: AppColors.cFF9BCD.withOpacity(0.36),
        iconPath: Assets.meeting,
        taskCount: "45",
        title: "Meeting"),
    CategoryModel(
        id: 3,
        color: AppColors.cFFD09B.withOpacity(0.36),
        iconPath: Assets.shopping,
        taskCount: "54",
        title: "Shopping"),
    CategoryModel(
        id: 4,
        color: AppColors.c9BFFF8.withOpacity(0.36),
        iconPath: Assets.party,
        taskCount: "24",
        title: "Party"),
    CategoryModel(
        id: 5,
        color: AppColors.cF59BFF.withOpacity(0.36),
        iconPath: Assets.study,
        taskCount: "24",
        title: "Study")
  ];
}
