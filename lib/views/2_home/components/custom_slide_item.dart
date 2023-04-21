import 'package:todo/export_files.dart';
class CustomSlideItem extends StatelessWidget {
  const CustomSlideItem({
    super.key,
    required this.iconPath,
    required this.color,
    this.margin,
    required this.onTap,
  });

  final String iconPath;
  final Color color;
  final EdgeInsets? margin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35.h,
        width: 35.w,
        margin: margin,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            height: 16.h,
          ),
        ),
      ),
    );
  }
}
