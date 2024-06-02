
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/request.dart';

class GetConnectExample extends StatelessWidget {
  const GetConnectExample({super.key});

  @override
  Widget build(BuildContext context) {
    final GetConnectController getConnectController = Get.put(GetConnectController());

    return Scaffold(
      appBar: AppBar(title: Text("123")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Obx(() => Text("互联网的数据${getConnectController.res}"))
          ],
        ),
      ),
    );
  }
}



class GetConnectController extends GetxController {

  final res = ''.obs;

  /// 控制器初始化时调用
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    print('onInit');

    final Request request = Request();
    final response = await request.get('https://www.baidu.com');
    res.value = response.body;
    print(response.body);
  }

  /// 控制器销毁时被调用
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print('onClose');
  }
}