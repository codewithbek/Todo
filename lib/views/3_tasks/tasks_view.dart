import 'package:todo/export_files.dart';
import 'package:todo/models/category_model.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    var category = CategoryModel.categories;
    return Scaffold(
      backgroundColor: Colors.white,
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
        itemCount: category.length,
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
                  color: AppColors.cBBBBBB.withOpacity(0.35),
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
                        color: category[index].color,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          category[index].iconPath,
                        ),
                      )),
                  Text(
                    category[index].title,
                    style: RubikFont.w500.copyWith(
                      color: AppColors.c686868,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "${category[index].taskCount} Tasks",
                    style: RubikFont.w400.copyWith(
                      color: AppColors.cA1A1A1,
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
