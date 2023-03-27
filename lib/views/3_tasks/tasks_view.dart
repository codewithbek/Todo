import 'package:todo/export_files.dart';
import 'package:todo/models/grid_model.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    var gridItem = GridModel.gridItems;
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.only(
          left: 18.w,
          top: 21.h,
          right: 18.w,
        ),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 19.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 0.7),
        itemCount: gridItem.length,
        itemBuilder: (context, index) {
          return Container(
            height: 180.h,
            width: 159.w,
            margin: EdgeInsets.only(bottom: 19.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.C_BBBBBB.withOpacity(0.35),
                  blurRadius: 11,
                  spreadRadius: 0,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 61.h,
                      width: 61.h,
                      decoration: BoxDecoration(
                        color: gridItem[index].color,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          gridItem[index].iconPath,
                        ),
                      )),
                  Text(
                    gridItem[index].title,
                    style: GoogleFonts.rubik(
                      color: AppColors.C_686868,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "${gridItem[index].taskCount} Tasks",
                    style: GoogleFonts.rubik(
                      color: AppColors.C_A1A1A1,
                      fontSize: 8.sp,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
