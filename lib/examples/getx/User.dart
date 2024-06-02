import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../store/user_store.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = Get.find<UserStore>();

    return Scaffold(
        appBar: AppBar(title: Text("User")),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    child: Text("退出登录"),
                    onPressed: () {
                      userStore.logout();
                      Get.offNamed('/login');
                    },
                  ),
                ]
            )

        )
    );
  }
}
