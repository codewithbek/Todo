import 'package:todo/export_files.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.onboard,
                width: 179.79.w,
                height: 195.65.h,
              ),
              SizedBox(height: 116.h),
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
