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
          Image.asset(Assets.notasks),
          Text(
            "No tasks",
            style: RubikFont.w500.copyWith(
              color: AppColors.c554E8F,
              fontSize: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
