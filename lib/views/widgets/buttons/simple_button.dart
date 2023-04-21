import 'package:todo/export_files.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        backgroundColor: AppColors.primaryColor,
      ),
      child: Text(
        title,
        style: RubikFont.w400.copyWith(
          fontSize: 13.sp,
          color: AppColors.white,
        ),
      ),
    );
  }
}
