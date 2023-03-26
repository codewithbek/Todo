import 'package:todo/export_files.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppIcons.onboard,
                width: 179.79.w,
                height: 195.65.h,
              ),
              SizedBox(height: 116.h),
              Text(
                "Reminders made simple",
                style: TextStyle(
                  color: AppColors.C_554E8F,
                  fontWeight: FontWeight.w500,
                  fontSize: 22.sp,
                ),
              ),
              SizedBox(height: 171.h),
              TextButton(
                onPressed: () {
                  Get.offAndToNamed(AppRoutes.fullView);
                },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
