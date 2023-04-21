import 'package:todo/export_files.dart';

class CategoryRepository {
  List<CategoryModel> categories = [
    CategoryModel(
      id: 0,
      gridColor: AppColors.cFFEE9B.withOpacity(0.36),
      iconPath: Assets.personal,
      title: "Personal",
      color: const Color(0xFFFFD506),
    ),
    CategoryModel(
        id: 1,
        color: const Color(0xFF5DE61A),
        gridColor: AppColors.cB5FF9B.withOpacity(0.36),
        iconPath: Assets.work,
        title: "Work"),
    CategoryModel(
        id: 2,
        color: const Color(0xFFD10263),
        gridColor: AppColors.cFF9BCD.withOpacity(0.36),
        iconPath: Assets.meeting,
        title: "Meeting"),
    CategoryModel(
        id: 3,
        color: const Color(0xFFF29130),
        gridColor: AppColors.cFFD09B.withOpacity(0.36),
        iconPath: Assets.shopping,
        title: "Shopping"),
    CategoryModel(
        id: 4,
        color: const Color(0xFF3044F2),
        gridColor: AppColors.c9BFFF8.withOpacity(0.36),
        iconPath: Assets.party,
        title: "Party"),
    CategoryModel(
        id: 5,
        color: const Color(0xFFBF0080),
        gridColor: AppColors.cF59BFF.withOpacity(0.36),
        iconPath: Assets.study,
        title: "Study")
  ];
  Color getColorById(int id) {
    return categories.where((element) => element.id == id).toList()[0].color;
  }

  String getNameById(int id) {
    return categories.where((element) => element.id == id).toList()[0].title;
  }
}
