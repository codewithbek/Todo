
import 'package:todo/export_files.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CricleButton extends StatelessWidget {
  const CricleButton({
    super.key,
    required this.onTap,
    required this.iconPath,
  });
  final VoidCallback onTap;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        height: 53.h,
        width: 53.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.cF456C3.withOpacity(0.47),
              spreadRadius: 0,
              blurRadius: 9,
              offset: const Offset(0, 7), // changes position of shadow
            ),
          ],
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: AppColors.floatButtonGradient,
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(iconPath),
        ),
      ),
    );
  }
}
