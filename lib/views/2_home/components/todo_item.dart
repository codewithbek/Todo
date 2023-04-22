import 'package:intl/intl.dart';
import 'package:todo/export_files.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.cachedTodo,
    required this.showDay,
  });

  final TodoModel cachedTodo;
  final bool showDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDay)
          Padding(
            padding: EdgeInsets.only(bottom: 15.h, top: 13.h),
            child: Text(
              DateTime.now().difference(cachedTodo.dateTime).inDays == 0
                  ? "Today"
                  : DateFormat.MMMEd().format(cachedTodo.dateTime),
              style: RubikFont.w500
                  .copyWith(fontSize: 13.sp, color: AppColors.c8B87B3),
            ),
          ),
        Slidable(
          key: ValueKey(cachedTodo.id),
          endActionPane: ActionPane(
            extentRatio: 0.28,
            motion: const ScrollMotion(),
            children: [
              CustomSlideItem(
                margin: EdgeInsets.only(left: 12.w, right: 6.w),
                iconPath: Assets.edit,
                color: AppColors.cC4CEF5,
                onTap: () {
                  showModalBottomSheet(
                    elevation: 0.0,
                    backgroundColor: AppColors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => EditTaskView(todoModel: cachedTodo),
                  );
                },
              ),
              CustomSlideItem(
                iconPath: Assets.delete,
                color: AppColors.cFFCFCF,
                onTap: () {
                  context.read<TodoBloc>().add(
                        DeleteTodoEvent(
                          id: cachedTodo.id,
                        ),
                      );
                },
              )
            ],
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 7.h),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 9,
                    offset: const Offset(0, 9),
                    color: AppColors.black.withOpacity(0.05)),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 55.h,
                  width: 4.w,
                  decoration: BoxDecoration(
                    color: context.read<CategoryRepository>().getColorById(
                          cachedTodo.categoryId,
                        ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 55.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      ),
                    ),
                    child: Row(
                      children: [
                        CustomCheckBox(
                            isSelected: cachedTodo.isDone,
                            onChanged: (v) {
                              cachedTodo.isDone = v;
                              context.read<TodoBloc>().add(
                                    UpdateTodoEvent(
                                      todoModel: cachedTodo,
                                    ),
                                  );
                            }),
                        SizedBox(width: 11.w),
                        Text(
                          DateFormat.Hm().format(cachedTodo.dateTime),
                          style: RubikFont.w400.copyWith(
                            fontSize: 11.sp,
                            color: AppColors.cC6C6C8,
                          ),
                        ),
                        SizedBox(width: 13.w),
                        Expanded(
                          child: Text(
                            cachedTodo.title,
                            style: RubikFont.w500.copyWith(
                              decorationColor: AppColors.cD9D9D9,
                              decoration: cachedTodo.isDone
                                  ? TextDecoration.underline
                                  : null,
                              fontSize: 14.sp,
                              color: cachedTodo.isDone
                                  ? AppColors.cD9D9D9
                                  : AppColors.c554E8F,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
