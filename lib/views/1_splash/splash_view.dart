import 'package:todo/export_files.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 75.h),
              Image.asset(
                Assets.onboard,
                width: 179.79.w,
                height: 195.65.h,
              ),
              SizedBox(height: 113.h),
              Text(
                "Reminders made simple",
                style: RubikFont.w500.copyWith(
                  color: AppColors.c554E8F,
                  fontSize: 22.sp,
                ),
              ),
              SizedBox(height: 171.h),
              GreenButton(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.fullView,
                    (r) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
