import 'package:todo/export_files.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
  final TextEditingController controller;
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.5.w),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: AppColors.c373737,
        cursorWidth: 2.w,
        cursorHeight: 32.h,
        focusNode: focusNode,
        style: RubikFont.w400.copyWith(
          color: AppColors.c373737,
        ),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.cFCFCFC,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.cFCFCFC,
            ),
          ),
        ),
      ),
    );
  }
}
