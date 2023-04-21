import 'package:todo/export_files.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 11,
            color: AppColors.cBBBBBB.withOpacity(0.35),
            offset: const Offset(0, 7),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 65.h,
            width: 65.w,
            decoration: BoxDecoration(
              color: categoryModel.gridColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                categoryModel.iconPath,
                height: 34.h,
              ),
            ),
          ),
          Text(
            categoryModel.title,
            style: RubikFont.w500.copyWith(
              fontSize: 18.sp,
              color: AppColors.c686868,
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            '${context.read<TodoBloc>().getTaskCountByCatgory(categoryModel.id)} Task',
            style: RubikFont.w400.copyWith(
              fontSize: 10.sp,
              color: AppColors.cA1A1A1,
            ),
          ),
        ],
      ),
    );
  }
}
