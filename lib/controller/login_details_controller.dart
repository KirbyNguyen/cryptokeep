import 'package:cryptokeep/controller/home_controller.dart';
import 'package:cryptokeep/models/login_model.dart';
import 'package:cryptokeep/services/password_service.dart';
import 'package:cryptokeep/utils/app_snackbar.dart';
import 'package:cryptokeep/utils/clipboard_manager.dart';
import 'package:cryptokeep/utils/constants.dart';
import 'package:get/get.dart';

class LoginDetailsController extends GetxController {
  RxBool showPassword = false.obs;

  void toggleShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void toggleFavorite(Login login) async {
    final _controller = Get.find<HomeController>();

    login.favorite = login.favorite != 0 ? 0 : 1;
    _controller.updateItem(login.id, login);
    
    String msg = login.favorite != 0 ? FAVORITE_ADDED : FAVORITE_REMOVED;
    AppSnackBar.show(Get.context, text: msg);
  }

  void onCopyClick(String data, int type) async {
    final clipboardManager = ClipBoardManager();
    clipboardManager.copyToClipboard(data);
    String msg = type == 0 ? USERNAME_COPIED : PASSWORD_COPIED;
    AppSnackBar.show(Get.context, text: msg);
  }

  int getScore(String password) {
    return PasswordService.calculateScore(password).ceil();
  }
}
