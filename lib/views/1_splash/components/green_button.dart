import 'package:todo/export_files.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    super.key, required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: 258.w,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.greenGradient,
        ),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            color: AppColors.c66C81C.withOpacity(0.53),
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.c66C81C,
          shadowColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Center(
          child: Text(
            "Get Started",
            style: RubikFont.w400.copyWith(
              fontSize: 15.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
