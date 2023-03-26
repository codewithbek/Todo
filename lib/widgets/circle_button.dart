import 'package:todo/export_files.dart';

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
    return FloatingActionButton(
      onPressed: onTap,
      child: Container(
        height: 53.h,
        width: 53.h,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.C_F456C3.withOpacity(0.47),
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
