
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store/user_store.dart';

class AuthMiddleWare extends GetMiddleware {

  /// 未登录重定向到登录页面
  @override
  RouteSettings? redirect(String? route) {
    final userStore = Get.find<UserStore>();
    return userStore.isLoggedIn ? null : RouteSettings(name: '/login?redirect=$route');
  }

}