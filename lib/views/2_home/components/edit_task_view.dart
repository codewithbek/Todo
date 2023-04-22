import 'package:intl/intl.dart';
import 'package:todo/export_files.dart';

class EditTaskView extends StatefulWidget {
  const EditTaskView({super.key, required this.todoModel});

  final TodoModel todoModel;

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  late final TextEditingController controller;
  List<CategoryModel> categories = [];
  late DateTime pickedDate;
  late int selectedCategoryId;

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = widget.todoModel.title;
    selectedCategoryId = widget.todoModel.categoryId;
    pickedDate = widget.todoModel.dateTime;
    categories = context.read<CategoryRepository>().categories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 400.h,
        width: 375.w,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomPaint(
              size: Size(375.w, 400.h),
              painter: BottomPaint(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 43.h),
                  Center(
                    child: Text(
                      "Edit task",
                      style: RubikFont.w500.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.c404040,
                      ),
                    ),
                  ),
                  CustomTextField(controller: controller),
                  SizedBox(height: 17.5.h),
                  SizedBox(
                    height: 30.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 15.5.w),
                      children: List.generate(
                        categories.length,
                        (index) => CategoryListItem(
                          category: categories[index],
                          isSelected:
                              categories[index].id == selectedCategoryId,
                          onPressed: () => setState(
                            () {
                              selectedCategoryId = categories[index].id;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13.5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.5.w),
                    child: Divider(
                      color: AppColors.cCFCFCF,
                      height: 1.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h, left: 18.w),
                    child: Row(
                      children: [
                        SimpleButton(
                          title: 'Choose date',
                          onPressed: () async {
                            DateTime? dateTime =
                                await DateTimeUtils.getDateTime(
                              context: context,
                            );
                            if (dateTime != null) {
                              setState(() {
                                pickedDate = dateTime;
                              });
                            }
                          },
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "${DateFormat.MMMMd().format(pickedDate)} ${DateFormat.Hm().format(pickedDate)} ",
                          style: RubikFont.w500.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.c404040,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  AddTaskButton(
                    onTap: () {
                      if (controller.text == '') {
                        MessageUtils.getMyToast(
                            message: 'Please fill the field');
                      } else if (pickedDate
                              .difference(DateTime.now())
                              .inMinutes <=
                          0) {
                        MessageUtils.getMyToast(
                            message: 'Task time must be in the future');
                      } else {
                        TodoModel updatedTodo = TodoModel(
                          id: widget.todoModel.id,
                          categoryId: selectedCategoryId,
                          dateTime: pickedDate,
                          title: controller.text,
                          isDone: widget.todoModel.isDone,
                        );
                        context.read<TodoBloc>().add(
                              UpdateTodoEvent(
                                todoModel: updatedTodo,
                              ),
                            );
                        LocalNotificationService.localNotificationService
                            .cancelNotificationById(updatedTodo.id!);
                        LocalNotificationService.localNotificationService
                            .scheduleNotification(
                          todoModel: updatedTodo,
                          categoryName: context
                              .read<CategoryRepository>()
                              .getNameById(selectedCategoryId),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    title: 'Save task',
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: -26.5.h,
              child: CricleButton(
                iconPath: Assets.close,
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
