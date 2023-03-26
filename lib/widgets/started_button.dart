import 'package:todo/export_files.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Container(
        width: 258.w,
        height: 56.29.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: AppColors.splashButtonGradient,
          ),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.C_66C81C.withOpacity(0.53),
              blurRadius: 30.0, // soften the shadow
              spreadRadius: 0, //extend the shadow
              offset: const Offset(
                  0, // Move to right 10  horizontally
                  5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Get Started",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.C_FCFCFC),
          ),
        ),
      ),
    );
  }
}
