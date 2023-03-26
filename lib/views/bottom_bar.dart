import 'package:todo/export_files.dart';
import 'package:todo/widgets/sized_text.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  bool isSelected = false;
  int currentIndex = 0;
  List<Widget> screens = [const HomeView(), const TasksView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[currentIndex],
      bottomNavigationBar: buildBottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                InkWell(
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
                                  AppIcons.home,
                                )
                              : SvgPicture.asset(
                                  AppIcons.home2,
                                ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedText(
                          text: 'Home',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: currentIndex == 0
                                ? AppColors.C_5F87E7
                                : AppColors.C_DADADA,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
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
                                  AppIcons.tasks,
                                )
                              : SvgPicture.asset(
                                  AppIcons.tasks2,
                                ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedText(
                          text: 'Tasks',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: currentIndex == 1
                                ? AppColors.C_5F87E7
                                : AppColors.C_DADADA,
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
              color: AppColors.C_E0E0E0,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );
  }
}
