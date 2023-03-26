import 'package:flutter/cupertino.dart';
import 'package:todo/export_files.dart';

class FullView extends StatefulWidget {
  const FullView({super.key});

  @override
  State<FullView> createState() => _FullViewState();
}

class _FullViewState extends State<FullView> {
  bool isSelected = false;
  int currentIndex = 0;
  int currentId = 1;

  List<Widget> screens = [const HomeView(), const TasksView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 190.h,
        elevation: 0,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello Brenda!\nToday you have 9 tasks",
                  style:
                      GoogleFonts.rubik(fontSize: 18.sp, color: Colors.white),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.r,
                  child: Icon(
                    CupertinoIcons.person_fill,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              height: 110.h,
              width: 339.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.31),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 9.h, right: 11.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today Reminder",
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            CupertinoIcons.clear,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Meeting with client",
                              style: GoogleFonts.rubik(
                                color: AppColors.C_F3F3F3,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "13.00 PM",
                              style: GoogleFonts.rubik(
                                color: AppColors.C_F3F3F3,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 40.0.w,
                          ),
                          child: SvgPicture.asset(
                            AppIcons.bigbell,
                            height: 60.h,
                            width: 52.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.appBarGradient,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.5, 1.0],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: screens[currentIndex],
      bottomNavigationBar: buildBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CricleButton(
        iconPath: AppIcons.add,
        onTap: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (context) => Center(
              child: CricleButton(
                onTap: () {
                  Navigator.pop(context);
                },
                iconPath: AppIcons.close,
              ),
            ),
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
