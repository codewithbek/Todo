import 'package:todo/export_files.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    required this.onTap, required this.title,
  });
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 323.w,
      height: 56.h,
      margin: EdgeInsets.symmetric(horizontal: 26.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.addTaskGradient,
        ),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.c6894EE,
            blurRadius: 6.0,
            spreadRadius: 0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.c6894EE,
          shadowColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            title,
            style: RubikFont.w400
                .copyWith(fontSize: 15.sp, color: AppColors.cFCFCFC),
          ),
        ),
      ),
    );
  }
}
