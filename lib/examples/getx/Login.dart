import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../store/user_store.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = Get.find<UserStore>();

    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    child: Text("点击登录"),
                    onPressed: () {
                      userStore.setToken('sdfsfd');
                      // 登录成功回到redirect页面,没有redirect页面回到根页面
                      Get.offNamed(Get.parameters['redirect'] ?? '/');
                    },
                  ),
                ]
            )

        )
    );
  }
}
