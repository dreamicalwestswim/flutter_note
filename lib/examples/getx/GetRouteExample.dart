import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetRouteExample extends StatelessWidget {
  const GetRouteExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("123")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("未登录进入私有页面"),
            TextButton(
              child: Text("进入user页面"),
              onPressed: () {
                Get.toNamed('/user');
              },
            ),

            Text("新路由进栈"),
            TextButton(
              child: Text("Get.to"),
              onPressed: () {
                Get.to(NewRoute());
              },
            ),

            Text("当前路由出栈=Navigator.pop(context)"),
            TextButton(
              child: Text("Get.back"),
              onPressed: () {
                Get.back();
              },
            ),

            Text("当前路由出栈新路由进栈"),
            TextButton(
              child: Text("Get.off"),
              onPressed: () {
                Get.off(NewRoute());
              },
            ),

            Text("所有路由出栈新路由进栈"),
            TextButton(
              child: Text("Get.offAll"),
              onPressed: () {
                Get.offAll(NewRoute());
              },
            ),

            Text("获取新路由关闭后回传的参数"),
            TextButton(
              child: Text("await Get.to"),
              onPressed: () async {
                var data = await Get.to(NewRoute());
                print(data);
              },
            ),

            Text("向新路由发送arguments参数"),
            TextButton(
              child: Text("Get.to(NewRoute(), arguments: '123456')"),
              onPressed: () async {
                Get.to(NewRoute(), arguments: "123456");
              },
            ),


            Text("向命名路由地址上发参数"),
            Text("Get.to(/NextScreen?device=phone&id=354)"),
            Text("页面里面这样获取Get.parameters['id']"),

            SizedBox(height: 20,),

            Text("动态路由参数获取"),
            Text('''
             GetPage(
        name: '/profile/:user',
        page: () => UserProfile(),
      )'''),
            Text("这样发送Get.toNamed(/profile/34954)"),
            Text("页面里面这样获取Get.parameters['user']"),

            SizedBox(height: 20,),

            Text("简化snackbar使用"),
            TextButton(
              child: Text("Get.snackbar('Hi', 'i am a modern snackbar')"),
              onPressed: () {
                Get.snackbar('Hi', 'i am a modern snackbar');
              },
            ),

            Text("简化dialog使用"),
            TextButton(
              child: Text("Get.defaultDialog"),
              onPressed: () {
                Get.defaultDialog(
                    onConfirm: () => print("Ok"),
                    middleText: "Dialog made in 3 lines of code"
                );
              },
            ),

            Text("简化bottomSheet使用"),
            TextButton(
              child: Text("Get.bottomSheet"),
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.music_note),
                              title: Text('Music'),
                              onTap: () {}
                          ),
                          ListTile(
                            leading: Icon(Icons.videocam),
                            title: Text('Video'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    isScrollControlled: true,
                  backgroundColor: Colors.white
                );
              },
            ),

            Text("这些快捷弹出窗口由于样式修改并不灵活，可以不用,自己封装各种通用的弹出框就行"),

          ],
        ),
      ),

    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Column(
        children: [
          Text("arguments ${Get.arguments}"),
          ElevatedButton(
            child: Text("This is new route"),
            onPressed: (){
              Get.back(result: "新路由回传的参数111");
            },
          )
        ],
      ),
    );
  }
}
