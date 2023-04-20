import 'package:todo/export_files.dart';

class MessageUtils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
        fontSize: 16.sp,
      );

  static void showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text ?? "",
          style: RubikFont.w500.copyWith(
            fontSize: 16.sp,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
