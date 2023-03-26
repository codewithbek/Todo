import 'package:todo/export_files.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NoTasksWidget(),
          Padding(
            padding: EdgeInsets.only(left: 18.0.w, top: 13.h, bottom: 21.h),
            child: Text(
              "Today",
              style: GoogleFonts.rubik(
                fontSize: 13.sp,
                color: AppColors.C_8B87B3,
                fontWeight: FontWeight.w500,
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
                    color: AppColors.C_F456C3,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(AppIcons.circle),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 18.0.h, right: 40.w),
                  child: Row(
                    children: [
                      Text(
                        "07.00 AM",
                        style: GoogleFonts.rubik(
                            color: AppColors.C_686868, fontSize: 11.sp),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Go jogging with Christin",
                        style: GoogleFonts.rubik(
                          color: AppColors.C_554E8F,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(AppIcons.bell),
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
