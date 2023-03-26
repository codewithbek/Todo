import 'package:todo/export_files.dart';
class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppIcons.notasks),
          Text(
            "No tasks",
            style: GoogleFonts.rubik(
              color: AppColors.C_554E8F,
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
