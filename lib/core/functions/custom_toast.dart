import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.primaryColor,
    textColor: AppColors.offWhite,
    fontSize: 16.0,
  );
}
