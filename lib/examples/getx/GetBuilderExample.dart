import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetBuilderExample extends StatelessWidget {
  const GetBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    /// 只会触发一次
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text("GetBuilder使用方式")),
      body: Column(
        children: <Widget>[
          GetBuilder<CounterController>(
            init: CounterController(),
            builder: (controller) {
              print(controller.count);
              return Text(
                'Count: ${controller.count}',
                style: TextStyle(fontSize: 24),
              );
            },
          ),
          GetBuilder<CounterController>(
            init: CounterController(),
            builder: (controller) {
              print(controller.count);
              return Text(
                'Count: ${controller.count}',
                style: TextStyle(fontSize: 24),
              );
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => CounterController.to.increment(),
                child: Text('Increment'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => CounterController.to.decrement(),
                child: Text('Decrement'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 业务分离,所有业务逻辑写到对于的模块控制器类里面
class CounterController extends GetxController {

  /// 通过一个静态方法返回更方便
  static CounterController get to => Get.find();

  var count = 0;

  void increment() {
    count++;
    // 需要手动通知ui更新
    update();
  }

  void decrement() {
    count--;
    // 需要手动通知ui更新
    update();
  }

  /// 控制器初始化时调用
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('onInit');
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