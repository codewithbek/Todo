import 'package:todo/export_files.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.5.w),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: isSelected
            ? Container(
                height: 30.h,
                padding: EdgeInsets.symmetric(
                  vertical: 5.h,
                  horizontal: 11.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: category.color,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                      color: category.color.withOpacity(0.33),
                    )
                  ],
                ),
                child: Text(
                  category.title,
                  style: RubikFont.w400.copyWith(
                    fontSize: 15.sp,
                    color: AppColors.white,
                  ),
                ),
              )
            : TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: onPressed,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.w,
                      margin: EdgeInsets.only(top: 4.h, right: 5.w),
                      decoration: BoxDecoration(
                        color: category.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      category.title,
                      style: RubikFont.w400.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.c8E8E8E,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onPressed;
}
