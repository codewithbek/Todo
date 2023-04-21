import 'package:todo/export_files.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();

  final bool isSelected;
  final ValueChanged<bool> onChanged;
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool value;

  @override
  void initState() {
    value = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          value = !value;
          widget.onChanged.call(value);
        });
      },
      child: AnimatedContainer(
        height: 18.h,
        width: 18.w,
        decoration: BoxDecoration(
          color: value ? AppColors.c91DC5A : AppColors.white,
          shape: BoxShape.circle,
          border: !value
              ? Border.all(
                  width: 1.5.w,
                  color: AppColors.cB5B5B5,
                )
              : null,
        ),
        duration: const Duration(milliseconds: 50),
        child: Center(
          child: Icon(
            Icons.check,
            color: AppColors.white,
            size: 15.sp,
          ),
        ),
      ),
    );
  }
}
