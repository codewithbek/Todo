import 'package:flutter/cupertino.dart';
import 'package:todo/export_files.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      elevation: 0.0,
      flexibleSpace: Container(
        width: double.infinity,
        height: 108.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: AppColors.appBarGradient),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            circleItem(
              size: 211,
              left: -80,
              top: -105,
            ),
            circleItem(
              size: 93,
              left: 299,
              top: -18,
            ),
            Positioned(
              left: 19.w,
              right: 19.w,
              bottom: 11.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Asadbek!",
                        style: RubikFont.w400.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        "Today you have  tasks",
                        style: RubikFont.w400.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 69.h);

  @override
  Widget get child => throw UnimplementedError();

  Widget circleItem({
    required double size,
    double? left,
    double? right,
    double? bottom,
    double? top,
  }) {
    return Positioned(
      left: left?.w,
      right: right?.w,
      top: top?.h,
      bottom: bottom?.h,
      child: Container(
        height: size.h,
        width: size.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white.withOpacity(0.17),
        ),
      ),
    );
  }
}
