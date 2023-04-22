import 'package:intl/intl.dart';
import 'package:todo/export_files.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late final TextEditingController controller;
  List<CategoryModel> categories = [];
  int selectedCategoryId = -1;
  DateTime? pickedDate;

  @override
  void initState() {
    controller = TextEditingController();
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
                      "Add new task",
                      style: RubikFont.w500.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.c404040,
                      ),
                    ),
                  ),
                  CustomTextField(controller: controller),
                  SizedBox(height: 17.5.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 21.w),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.black.withOpacity(0.1))),
                  ),
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
                          onPressed: () => setState(() {
                            selectedCategoryId = categories[index].id;
                          }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13.5.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 21.w),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.black.withOpacity(0.1))),
                  ),
                  SizedBox(height: 13.5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21.5.w),
                    child: Divider(
                      color: AppColors.cFCFCFC,
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
                            if (dateTime == null) {
                              MessageUtils.getMyToast(
                                message: 'Please choose date and time',
                              );
                            } else {
                              setState(() {
                                pickedDate = dateTime;
                              });
                            }
                          },
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          pickedDate == null
                              ? 'Not Choosed'
                              : "${DateFormat.MMMMd().format(pickedDate!)} ${DateFormat.Hm().format(pickedDate!)} ",
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
                      context.read<TodoBloc>().add(
                            AddTodoEvent(
                              selectedCategoryId: selectedCategoryId,
                              title: controller.text,
                              dateTime: pickedDate,
                              context: context,
                              categoryName: context
                                  .read<CategoryRepository>()
                                  .getNameById(selectedCategoryId),
                              key: selectedCategoryId,
                            ),
                          );
                    },
                    title: "Add Task",
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
