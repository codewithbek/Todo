import 'package:todo/export_files.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 323.w,
        height: 56.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: AppColors.addTaskGradient,
          ),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: AppColors.C_6894EE,
              blurRadius: 6.0,
              spreadRadius: 0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Add task",
            style: GoogleFonts.rubik(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.C_FCFCFC),
          ),
        ),
      ),
    );
  }
}