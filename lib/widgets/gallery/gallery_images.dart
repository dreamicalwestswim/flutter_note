import 'package:flutter/material.dart';
import '../fade_in_route.dart';
import 'images_preview.dart';



/// 相册预览组件
class GalleryImages extends StatefulWidget {

  /// 间距
  final double spacing;

  /// 一行展示的数量
  final int crossAxisCount;

  /// 图库列表数据
  final List<ImagesPreviewItem> items;

  const GalleryImages({
    Key? key,
    this.spacing = 16,
    this.crossAxisCount = 3,
    required this.items,
  }) : super(key: key);

  @override
  State<GalleryImages> createState() => _GalleryPreviewState();
}

class _GalleryPreviewState extends State<GalleryImages> {

  /// 隐藏索引
  int? _index;

  /// 显示大图预览
  void _showFullScreenImage(int index) {
    Navigator.push(
        context,
        FadeInRoute(
          opaque: false,
          builder: (context) {
            return ImagesPreview(
              items: widget.items,
              initialIndex: index,
              onPageChanged: (int index) {
                final item = widget.items[index];
                /// 没有id说明没有hero动画，不用修改隐藏索引
                if(item.id != null){
                  setState(() {
                    _index = index;
                  });
                }
              },
            );
          },
          /// 路由关闭完成后，不再隐藏图片
          onTransitionDismissed: () {
            /// 如果隐藏索引存在的话清空
            if(_index != null){
              setState(() {
                _index = null;
              });
            }
          },
        )
    );
  }

  /// 根据id构建不同的图片
  Widget _buildImage(ImagesPreviewItem e) {
    return e.id != null
        ? Hero(
      tag: e.id!,
      child: Image(
        image: getImageProvider(e.loadType, e.lowSource ?? e.resource),
        fit: BoxFit.cover,
      ),
    )
        : Image(
      image: getImageProvider(e.loadType, e.lowSource ?? e.resource),
      fit: BoxFit.cover,
    );
  }


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount, //横轴widget数量
        childAspectRatio: 1.0, //宽高比为1时，子widget
        mainAxisSpacing: widget.spacing, // 主轴方向的间距
        crossAxisSpacing: widget.spacing, // 横轴方向子元素的间距
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return Opacity(
          key: ValueKey(_index.toString()),
          opacity: (_index == index) ? 0.0 : 1.0,
          child: GestureDetector(
            /// 没有原图的话不用展示大图
            onTap: item.resource == null ? null : () => _showFullScreenImage(index),
            child: _buildImage(item),
          )
        );
      },
    );
  }
}