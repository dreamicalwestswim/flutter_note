
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:using_notes/widgets/gallery/images_picker.dart';
import 'package:using_notes/widgets/gallery/images_preview.dart';

import '../fade_in_route.dart';


/// 相册选择数据签名
class GalleryPickerItem {
  ImagesPreviewItem imagesPreviewItem;
  XFile xFile;

  GalleryPickerItem({
    required this.imagesPreviewItem,
    required this.xFile
  });
}

// TODO 后面有需求再开发
class GalleryPicker extends StatefulWidget {
  /// 多选
  final bool multiple;

  /// 多选数量
  final int limit;

  /// 间距
  final double spacing;

  /// 一行展示的数量
  final int crossAxisCount;

  /// 最大尺寸
  final double? maxSize;

  /// 图片质量(0-100)
  final int imageQuality;

  /// 选择图片变化回调(外部通过此回调获取到图片文件信息)
  final ValueChanged<List<XFile>> onChanged;

  const GalleryPicker({
    Key? key,
    this.multiple = true,
    this.limit = 9,
    this.spacing = 16,
    this.crossAxisCount = 3,
    this.maxSize = 2000,
    this.imageQuality = 90,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<GalleryPicker> createState() => _GalleryPickerState();
}

class _GalleryPickerState extends State<GalleryPicker> {
  /// 选取的文件内容
  final List<GalleryPickerItem> _items = [];

  /// 隐藏索引
  int? _index;

  /// 获取列表的XFile
  get _xFiles => _items.map((item) => item.xFile).toList();

  /// 获取列表的预览数据
  get _imagesPreviewItems => _items.map((item) => item.imagesPreviewItem).toList();

  /// 关闭按钮的尺寸
  static const double closeSize = 22;

  @override
  void initState() {
    super.initState();
  }

  /// 修改通知
  _changeNotice() {
    widget.onChanged(_xFiles);
  }

  /// 添加数据
  _addItems(List<GalleryPickerItem> items) {
    setState(() {
      _items.addAll(items);
    });
    _changeNotice();
  }

  /// 移除数据
  _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
    _changeNotice();
  }

  /// 选择图片
  _handlerChange(List<XFile> items) {
    List<GalleryPickerItem> list = items.map((xFile) => GalleryPickerItem(
        xFile: xFile,
        imagesPreviewItem: ImagesPreviewItem(
          id: xFile.name + DateTime.now().millisecondsSinceEpoch.toString(),
          resource: File(xFile.path),
          loadType: ImageLoadType.file,
        )
    )).toList();
    _addItems(list);
  }

  /// 显示大图预览
  void _showFullScreenImage(int index) {
    setState(() {
      _index = index;
    });
    Navigator.push(
        context,
        FadeInRoute(
          opaque: false,
          builder: (context) {
            return ImagesPreview(
              items: _imagesPreviewItems,
              initialIndex: index,
              onPageChanged: (int index) {
                setState(() {
                  _index = index;
                });
              },
            );
          },
          /// 路由关闭完成后，不再隐藏图片
          onTransitionDismissed: () {
            setState(() {
              _index = null;
            });
          },
        )
    );
  }

  /// 构建每一项数据
  Widget _buildImageItem(int index) {
    ImagesPreviewItem item = _imagesPreviewItems[index];
    return Opacity(
      key: ValueKey(_index.toString()),
      opacity: (_index == index) ? 0.0 : 1.0,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: closeSize / 2, right: closeSize / 2),
            child: GestureDetector(
              onTap: () => _showFullScreenImage(index),
              child: Hero(
                tag: item.id!,
                child: Image.file(
                  item.resource,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => _removeItem(index),
              child: Container(
                width: closeSize,
                height: closeSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffe1e1e1),
                ),
                child: const Icon(
                  Icons.close,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final limit = widget.limit - _items.length;
    return GridView.builder(
        padding: const EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount, //横轴widget数量
          childAspectRatio: 1.0, //宽高比为1时，子widget
          mainAxisSpacing: widget.spacing - closeSize / 2, // 主轴方向的间距
          crossAxisSpacing: widget.spacing - closeSize / 2, // 横轴方向子元素的间距
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        /// 展示的数量，长度未超过限制要多加一个上传
        itemCount: _items.length + (_items.length < widget.limit ? 1 : 0),
        itemBuilder: (context, index) {
          /// 添加按钮显示最最后面
          if (index == _items.length && _items.length < widget.limit) {
            return Padding(
              padding: const EdgeInsets.only(top: closeSize / 2, right: closeSize / 2),
              child: ImagesPicker(
                limit: limit,
                onChanged: _handlerChange,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.photo_camera_outlined, size: 30, color: Color(0xff595959)),
                      Text(_items.isNotEmpty ? "还可添加$limit张" : "添加图片", style: const TextStyle(color: Color(0xff595959)),),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return _buildImageItem(index);
          }
        }
    );
  }
}
