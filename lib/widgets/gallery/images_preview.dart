import 'dart:math';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// 图片加载类型
enum ImageLoadType {
  network,
  file,
  asset,
  memory,
}

/// 图库数据模型
class ImagesPreviewItem {
  ImagesPreviewItem({
    this.id,
    this.resource,
    this.lowSource,
    this.loadType = ImageLoadType.network,
  });

  /// id hero动画需要用到(罕见情况下可以不要，所以选填)
  final String? id;

  /// 原图
  final dynamic resource;

  /// 预览图
  final dynamic lowSource;

  /// 图片加载类型
  final ImageLoadType loadType;
}

/// 根据加载类型获取到图片的Provider
ImageProvider getImageProvider(ImageLoadType loadType, dynamic source) {
  switch (loadType) {
    case ImageLoadType.asset:
      return AssetImage(source);
    case ImageLoadType.network:
      return NetworkImage(source);
    case ImageLoadType.file:
      return FileImage(source);
    case ImageLoadType.memory:
      return MemoryImage(source);
  }
}

/// 图片预览组件
class ImagesPreview extends StatefulWidget {

  /// 初始展示图片下标
  final int? initialIndex;

  /// 图库项数据
  final List<ImagesPreviewItem> items;

  /// 图片切换回调
  final void Function(int)? onPageChanged;

  const ImagesPreview({
    super.key,
    this.initialIndex = 0,
    required this.items,
    this.onPageChanged,
  });

  @override
  State<ImagesPreview> createState() => _ImagesPreviewState();
}

class _ImagesPreviewState extends State<ImagesPreview> {

  /// 当前索引
  late int currentIndex = widget.initialIndex!;

  /// page控制器(控制初始展示的索引)
  late PageController _pageController;

  /// 开始拖拽的位置
  Offset beginningDragPosition = Offset.zero;

  /// 当前拖拽的位置
  Offset currentDragPosition = Offset.zero;

  /// 缩放的状态(initial、originalSize)
  PhotoViewScaleState scaleState = PhotoViewScaleState.initial;

  /// 图片动画的时长
  int photoViewAnimationDurationMilliSec = 0;

  /// 按在图片上的位置相对位置
  Offset tapLocalPosition = Offset.zero;

  /// 是拖拽中标记(用来隔离拖拽与视图内部事件)
  bool _isDragging = false;

  /// 触控点数量(只允许单指才能拖动)
  int _pointerCount = 0;

  /// 是向下拖拽标记(只有先向下拖拽才允许自由拖拽)
  bool _hasDraggedDownwards = false;

  /// 关闭的距离
  int closeDistance = 100;

  @override
  void initState() {
    super.initState();
    /// 初始化控制器并按索引展示视图
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    /// 清理控制器
    _pageController.dispose();
    super.dispose();
  }

  /// 计算当前缩放比例，随着拖动距离的增加而缩小，但最小为0.8
  double get photoViewScale {
    /// 向上拖的话不缩小
    return currentDragPosition.dy <= 0 ? 1 : max(1.0 - currentDragPosition.distance * 0.001, 0.8);
  }

  /// 计算背景透明度，随着拖动距离的增加而降低，但最小为0.1
  double get bgOpacity {
    /// 向上拖的话透明度不变
    return currentDragPosition.dy <= 0 ? 1 : max(1.0 - currentDragPosition.distance * 0.005, 0.1);
  }

  /// 计算 PhotoView 的变换矩阵，确保缩放是围绕点击位置进行的
  Matrix4 get photoViewTransform {
    final scale = photoViewScale;

    /// 确保缩放是围绕点击位置进行的平移
    final scaleTranslation = Matrix4.translationValues(
      tapLocalPosition.dx * (1 - scale),
      tapLocalPosition.dy * (1 - scale),
      0,
    );

    /// 当前的平移变换
    final translationTransform = Matrix4.translationValues(
      currentDragPosition.dx,
      currentDragPosition.dy,
      0.0,
    );

    /// 缩放变换
    final scaleTransform = Matrix4.diagonal3Values(
      scale,
      scale,
      1.0,
    );

    /// 返回组合变换矩阵
    return translationTransform * scaleTranslation * scaleTransform;
  }

  /// 拖动开始
  void onVerticalDragStart(DragStartDetails details) {
    if(scaleState != PhotoViewScaleState.initial)return;
    setState(() {
      _isDragging = true;
      photoViewAnimationDurationMilliSec = 0;
    });
    _hasDraggedDownwards = false;
    beginningDragPosition = details.globalPosition;
  }

  /// 拖动更新
  void onVerticalDragUpdate(DragUpdateDetails details) {
    /// 未放大状态才能拖，还有只能一个手指拖，防止多指冲突
    if(scaleState != PhotoViewScaleState.initial || _pointerCount != 1)return;

    /// 新的位置减拖拽开始位置的到新的位置信息
    final newPosition = Offset(
      details.globalPosition.dx - beginningDragPosition.dx,
      details.globalPosition.dy - beginningDragPosition.dy,
    );

    /// 检查是否已向下拖动
    if (!_hasDraggedDownwards && newPosition.dy >= 0) {
      _hasDraggedDownwards = true;
    }

    /// 如果已向下拖动，允许任意方向拖动；否则仅允许向下拖动
    if (_hasDraggedDownwards) {
      setState(() {
        currentDragPosition = newPosition;
      });
    }
  }

  /// 拖动结束
  void onVerticalDragEnd(DragEndDetails details) {
    if(scaleState != PhotoViewScaleState.initial)return;
    /// 小余距离或者拖到上面回到之前的状态
    if (currentDragPosition.distance < closeDistance || currentDragPosition.dy < 0) {
      setState(() {
        _isDragging = false;
        photoViewAnimationDurationMilliSec = 200;
        currentDragPosition = Offset.zero;
      });
    } else {
      /// 只有往下拖超过距离才关闭
      Navigator.of(context).pop();
    }
  }

  /// 页码修改
  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    /// 切换后缩放状态等于initial
    scaleState = PhotoViewScaleState.initial;
    /// 通知外部修改索引
    widget.onPageChanged!(index);
  }

  /// 双击视图放大的状态(只要initial和originalSize)
  PhotoViewScaleState twoStateScaleStateCycle(PhotoViewScaleState actual) {
    switch (actual) {
      case PhotoViewScaleState.initial:
        return PhotoViewScaleState.originalSize;
      case PhotoViewScaleState.originalSize:
      default:
        return PhotoViewScaleState.initial;
    }
  }

  /// 构造loading
  Widget _buildLoading(BuildContext context, ImageChunkEvent? event,) {
    return Center(
      child: SizedBox(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          value: event == null ? null : event.cumulativeBytesLoaded / (event.expectedTotalBytes as int),
        ),
      ),
    );
  }

  /// 构建每一项内容
  Widget _buildItem(BuildContext context, int index) {

    final ImagesPreviewItem item = widget.items[index];
    /// 图片优先读原图，如果没有则读预览图，保证可以显示图片。
    var source = item.resource ?? item.lowSource;
    final ImageProvider imageProvider = getImageProvider(item.loadType, source);

    return ClipRect(
      /// 用原始事件记录一下触摸在屏幕上的手指(单指才允许拖动防止多指移动画面抖动)
        child: Listener(
          onPointerDown: (PointerDownEvent event){
            _pointerCount++;
          },
          onPointerUp: (PointerUpEvent event){
            _pointerCount--;
          },
          /// 用功能事件触发特定方法
          child: GestureDetector(
            /// 按下触发(按下到拖拽结束只会触发一次)
            onTapDown: (details) {
              tapLocalPosition = details.localPosition;
            },
            /// 垂直拖拽开始
            onVerticalDragStart: onVerticalDragStart,
            /// 垂直拖拽变化
            onVerticalDragUpdate: onVerticalDragUpdate,
            /// 垂直拖拽结束
            onVerticalDragEnd: onVerticalDragEnd,
            /// 动画容器包一下视图，拖动未超过关闭距离需要动画还原回去
            child: AnimatedContainer(
              /// 动画持续时间，拖动的时候是没有动画的，还原回去才有动画
              duration: Duration(milliseconds: photoViewAnimationDurationMilliSec),
              /// 变换过的矩阵(通过矩阵控制修改)
              transform: photoViewTransform,
              child: PhotoView(
                /// 拖拽时内部事件禁掉，防止拖拽与内部事件冲突
                disableGestures: _isDragging,
                backgroundDecoration: const BoxDecoration(color: Colors.transparent),
                imageProvider: imageProvider,
                heroAttributes: item.id != null ? PhotoViewHeroAttributes(tag: item.id!) : null,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
                scaleStateCycle: twoStateScaleStateCycle,
                loadingBuilder: _buildLoading,
                scaleStateChangedCallback: (state) {
                  scaleState = state;
                },
              ),
            ),
          ),
        )
    );
  }

  Widget _buildTopControls() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Positioned(
      top: statusBarHeight,
      left: 15,
      right: 15,
      child: Opacity(
          opacity: _isDragging ? 0 : 1,
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close_rounded, color: Colors.white),
                ),
                Text("${currentIndex + 1}/${widget.items.length}",
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(1, 1)),
                      ],
                    )
                ),
                const SizedBox()
              ],
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(bgOpacity),
      child: Stack(
        children: [
          /// PhotoViewGestureDetectorScope包一下让PageView可以和子元素缩放融合，移动边界才切换下一页
          PhotoViewGestureDetectorScope(
            axis: Axis.horizontal,
            child: PageView.builder(
              itemCount: widget.items.length,
              itemBuilder: _buildItem,
              onPageChanged: onPageChanged,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
            ),
          ),

          _buildTopControls(),

        ],
      ),
    );
  }

}