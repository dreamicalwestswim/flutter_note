
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// 用户数据
class UserStore extends GetxController {
  final GetStorage storageBox = GetStorage();

  final token = "".obs;

  // 是否登录
  bool get isLoggedIn => token.value.isNotEmpty;

  void setToken(String token) {
    this.token.value = token;
    storageBox.write('token', token);
  }

  void logout() {
    token.value = "";
    storageBox.remove('token');
  }

  /// 控制器初始化时调用
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('onInit');

    token.value = storageBox.read('token') ?? '';
  }

  /// 控制器完全准备好时调用
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print('onReady');
  }

  /// 控制器销毁时被调用
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('onClose');
  }

}
