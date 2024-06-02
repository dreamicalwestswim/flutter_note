import 'package:flutter/material.dart';

class WidgetExplain extends StatelessWidget {
  final String title;

  const WidgetExplain({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text('1.根据 Widget 树生成一个 Element 树，每一个Widget里面都有一个createElement方法，将widget实例转换成Element对象， 为什么要生成Element树呢，因为Widget是提供给开发者的声明层结构，最终需要转换成更利于渲染的数据，Element和Widget是一一对应的结构\n\n2.根据 Element 树生成 Render 树（渲染树）Element和Render不是一一对应的关系，比如一个容器定义了大小约束，颜色相关信息，在描述与Element层是多个对象，但是在渲染的时候其实会被合成一个对象(这一环节开始执行细粒度的显示对象渲染)\n\n3.根据渲染树生成 Layer 树（这一环节执行分层与输出到屏幕展示）'),
            
            Image.asset('assets/images/render.png')
          ],
        ),
      ),
    );
  }
}
