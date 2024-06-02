import 'package:flutter/material.dart';

class ImageExample3 extends StatefulWidget {
  final String title;

  const ImageExample3({Key? key, required this.title}) : super(key: key);

  @override
  State<ImageExample3> createState() => _ImageExampleState();
}

class _ImageExampleState extends State<ImageExample3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(padding: const EdgeInsets.all(10), children: <Widget>[
          Text("圆形头像"),
          Text('''
          CircleAvatar({   
          Key? key,   
          Widget? child,   子元素
          Color? backgroundColor,   背景颜色
          ImageProvider ? backgroundImage,   背景图片
          ImageProvider ? foregroundImage,   前景图片
          void Function(Object, StackTrace?)? onBackgroundImageError,   背景图片出错处理
          void Function(Object, StackTrace?)? onForegroundImageError,   前景图片出错处理
          Color? foregroundColor,   前景颜色
          double? radius,   半径
          double? minRadius,   最小半径
          double? maxRadius, 最大半径
          })
          '''),
          CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xffFDCF09),
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage("assets/images/guy.png"),
              )),
          CircleAvatar(
            radius: 110,
            backgroundColor: Colors.blue,
            child: Text(
              'TVH',
              style: TextStyle(fontSize: 90, color: Colors.white),
            ),
          ),
          Text("Container + 内部属性 DecorationImage"),
          Text('''
          DecorationImage({   
          required ImageProvider  image,   图片源
          void Function(Object, StackTrace?)? onError,   出错处理
          ColorFilter? colorFilter,   颜色滤镜
          BoxFit? fit,   裁剪方式
          AlignmentGeometry alignment = Alignment.center,   对其方式
          Rect? centerSlice,   
          ImageRepeat repeat = ImageRepeat.noRepeat,   平铺方式
          bool matchTextDirection = false,   
          double scale = 1.0,   比例
          double opacity = 1.0,   透明度
          FilterQuality filterQuality = FilterQuality.low,   滤镜质量
          bool invertColors = false,   反转颜色
          bool isAntiAlias = false,
          })
          '''),
          UnconstrainedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/guy.png"),
                ),
              ),
              width: 80,
              height: 80,
            ),
          ),
          UnconstrainedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/guy.png"),
                ),
              ),
              width: 80,
              height: 80,
            ),
          ),
          Text("ClipOval"),
          Text('''
          ClipOval({   
          Key? key,   
          CustomClipper ? clipper,   自定义裁剪
          Clip clipBehavior = Clip.antiAlias,   裁剪模式
          Widget? child,
          })
          '''),
          UnconstrainedBox(
            child: ClipOval(
              child: Image.asset(
                'assets/images/guy.png',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text("ClipRRect"),
          Text('''
          ClipRRect({   
          Key? key,   
          BorderRadius? borderRadius = BorderRadius.zero,   边框半径
          CustomClipper ? clipper,   自定义裁剪
          Clip clipBehavior = Clip.antiAlias,   裁剪模式
          Widget? child,
          })
          '''),
          UnconstrainedBox(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/guy.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )),
          ),
          UnconstrainedBox(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/guy.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )),
          ),


          Text("ClipPath"),
          Text('''
          自定义裁剪路径
          '''),
          UnconstrainedBox(
            child:  ClipPath(
              clipper: CircleClipper(),
              child: Image.asset(
                'assets/images/guy.png',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ]));
  }
}


class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}