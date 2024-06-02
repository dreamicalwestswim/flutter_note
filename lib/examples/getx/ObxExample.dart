import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// 声明可观察数据的方式
// 1 - 第一种是使用 Rx{Type}。
// // 建议使用初始值，但不是强制性的
// final name = RxString('');
// final isLogged = RxBool(false);
// final count = RxInt(0);
// final balance = RxDouble(0.0);
// final items = RxList<String>([]);
// final myMap = RxMap<String, int>({});
//
// 2 - 第二种是使用 Rx，规定泛型 Rx<Type>。
// final name = Rx<String>('');
// final isLogged = Rx<Bool>(false);
// final count = Rx<Int>(0);
// final balance = Rx<Double>(0.0);
// final number = Rx<Num>(0)
// final items = Rx<List<String>>([]);
// final myMap = Rx<Map<String, int>>({});
// // 自定义类 - 可以是任何类
// final user = Rx<User>();
//
// 3 - 第三种更实用、更简单、更可取的方法，只需添加 .obs 作为value的属性。
// final name = ''.obs;
// final isLogged = false.obs;
// final count = 0.obs;
// final balance = 0.0.obs;
// final number = 0.obs;
// final items = <String>[].obs;
// final myMap = <String, int>{}.obs;
// // 自定义类 - 可以是任何类
// final user = User().obs;

class ObxExample extends StatelessWidget {
  const ObxExample({super.key});

  @override
  Widget build(BuildContext context) {
    /// 只会触发一次
    print('build');

    /// Get.put实例化控制器
    /// 如果全局要共享同一个实例将 permanent设为true，则控制器不会被移除,默认是卸载组件时同时去除控制器，下一次再进来又回到初始状态了
    /// 外面一定要结合getPages来定义路由，否则Getx不会清除控制器实例
    final CounterController2 counterController = Get.put(CounterController2(), permanent: true);

    return Scaffold(
      appBar: AppBar(title: Text("Obx使用方式")),
      body: Column(
        children: <Widget>[
          Obx(() => Text("Count: ${counterController.count}")),
          Obx(() => Text("${counterController.count} + ${counterController.count2} = ${counterController.sum}")),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => counterController.increment(),
                child: Text('Increment'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => counterController.decrement(),
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
class CounterController2 extends GetxController {
  final GetStorage storageBox = GetStorage();

  /// 通过重栽符号声明可观察数据
  final count = 0.obs;
  final count2 = 5.obs;
  int get sum => count.value + count2.value;

  void increment() {
    count.value++;
    storageBox.write('count', count.value);
  }

  void decrement() {
    count.value--;
    storageBox.write('count', count.value);
  }

  /// 控制器初始化时调用
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('onInit');
    // 从本地拿数据
    count.value = storageBox.read<int>('count') ?? 0;
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