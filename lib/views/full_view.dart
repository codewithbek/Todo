import 'package:todo/export_files.dart';
import 'package:todo/views/4_addtask/add_task_view.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FullView extends StatefulWidget {
  const FullView({super.key});

  @override
  State<FullView> createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {
  int currentIndex = 0;

  List<Widget> screens = [const HomeView(), const TasksView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      resizeToAvoidBottomInset: false,
      body: screens[currentIndex],
      bottomNavigationBar: buildBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CricleButton(
        iconPath: Assets.add,
        onTap: () {
          showModalBottomSheet(
            elevation: 0.0,
            backgroundColor: AppColors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => const AddTaskView(),
          );
        },
      ),
    );
  }

  Container buildBottomBar() {
    return Container(
      alignment: Alignment.center,
      height: 76.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300.withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, -6), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 46.w, right: 46.w, top: 9.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: currentIndex == 0
                              ? SvgPicture.asset(
                                  Assets.home,
                                )
                              : SvgPicture.asset(
                                  Assets.home2,
                                ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Home',
                          style: RubikFont.w500.copyWith(
                            fontSize: 10.sp,
                            color: currentIndex == 0
                                ? AppColors.primaryColor
                                : AppColors.cDADADA,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24.h,
                          width: 24.w,
                          child: currentIndex == 1
                              ? SvgPicture.asset(
                                  Assets.tasks,
                                )
                              : SvgPicture.asset(
                                  Assets.tasks2,
                                ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          'Tasks',
                          style: RubikFont.w500.copyWith(
                            fontSize: 10.sp,
                            color: currentIndex == 1
                                ? AppColors.primaryColor
                                : AppColors.cDADADA,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 4.h,
            width: 132.w,
            decoration: BoxDecoration(
              color: AppColors.cE0E0E0,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }
}
