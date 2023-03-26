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
              GetStartedButton(
                onTap: () {
                  Get.offAndToNamed(AppRoutes.fullView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


