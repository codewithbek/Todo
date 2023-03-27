import 'package:todo/export_files.dart';

class GridModel {
  GridModel({
    required this.iconPath,
    required this.taskCount,
    required this.title,
    required this.color,
  });
  final String iconPath;
  final String title;
  final String taskCount;
  final Color color;
  static List<GridModel> gridItems = [
    GridModel(
        color: AppColors.C_FFEE9B.withOpacity(0.36),
        iconPath: AppIcons.personal,
        taskCount: "24",
        title: "Personal"),
    GridModel(
        color: AppColors.C_B5FF9B.withOpacity(0.36),
        iconPath: AppIcons.work,
        taskCount: "44",
        title: "Work"),
    GridModel(
        color: AppColors.C_FF9BCD.withOpacity(0.36),
        iconPath: AppIcons.meeting,
        taskCount: "45",
        title: "Meeting"),
    GridModel(
        color: AppColors.C_FFD09B.withOpacity(0.36),
        iconPath: AppIcons.shopping,
        taskCount: "54",
        title: "Shopping"),
    GridModel(
        color: AppColors.C_9BFFF8.withOpacity(0.36),
        iconPath: AppIcons.party,
        taskCount: "24",
        title: "Party"),
    GridModel(
        color: AppColors.C_F59BFF.withOpacity(0.36),
        iconPath: AppIcons.study,
        taskCount: "24",
        title: "Study")
  ];
}
