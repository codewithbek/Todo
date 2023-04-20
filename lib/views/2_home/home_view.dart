import 'package:todo/export_files.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NoTasksWidget(),
          Padding(
            padding: EdgeInsets.only(left: 18.0.w, top: 13.h, bottom: 21.h),
            child: Text(
              "Today",
              style: RubikFont.w500.copyWith(
                fontSize: 13.sp,
                color: AppColors.c8B87B3,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 13.h),
            height: 55.h,
            width: 339.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300.withOpacity(0.5),
                  blurRadius: 9,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 4.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    color: AppColors.cF456C3,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(Assets.circle),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 18.0.h, right: 40.w),
                  child: Row(
                    children: [
                      Text(
                        "07.00 AM",
                        style: RubikFont.w400.copyWith(
                            color: AppColors.c686868, fontSize: 11.sp),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Go jogging with Christin",
                        style: RubikFont.w500.copyWith(
                          color: AppColors.c554E8F,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(Assets.bell),
                ),
                SizedBox(width: 5.w)
              ],
            ),
          )
        ],
      ),
    );
  }
}
