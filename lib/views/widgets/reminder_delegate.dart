import 'package:intl/intl.dart';
import 'package:todo/export_files.dart';

class ReminderDelegate extends SliverPersistentHeaderDelegate {
  ReminderDelegate(this.cachedTodo);

  final TodoModel cachedTodo;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return BlocSelector<TodoBloc, TodoState, num>(
      selector: (state) => state.showReminder ? 132.h : 0,
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(microseconds: 500),
          height: state.toDouble(),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 13.h,
            horizontal: 18.w,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.appBarGradient,
            ),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.31),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -5.h,
                  right: -5.h,
                  child: IconButton(
                    onPressed: () => context.read<TodoBloc>().add(
                          CloseReminderEvent(),
                        ),
                    icon: SvgPicture.asset(
                      Assets.xNoteIcon,
                      height: 15.h,
                    ),
                  ),
                ),
                Positioned(
                  left: 16.w,
                  top: 21.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today Reminder",
                        style: RubikFont.w500.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        cachedTodo.title,
                        style: RubikFont.w400.copyWith(
                            color: AppColors.cF3F3F3, fontSize: 11.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        DateFormat.Hm().format(cachedTodo.dateTime),
                        style: RubikFont.w400.copyWith(
                            color: AppColors.cF3F3F3, fontSize: 11.sp),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  double get maxExtent => 132.h;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
