import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

/// 第三方包依赖
/// image_picker 官方实现不同平台拍照与相册读取能力、

/// Android 开箱即用无需设置

/// ios需要开启相机和相册权限,ios/Runner/Info.plist 插入以下代码
/// <key>NSPhotoLibraryUsageDescription</key>
/// <string>App需要您的同意,才能访问相册</string>
/// <key>NSPhotoLibraryAddUsageDescription</key>
/// <string>App需要您的同意,才能访问相册</string>
///	<key>NSCameraUsageDescription</key>
/// <string>App需要您的同意,才能访问相机</string>
///	<key>NSCameraUsageDescription</key>
/// <string>App需要您的同意,才能访问相机</string>

/// ios 相册不显示中文问题
/// 打开Xode “Runner” -> “info.plist”，添加一项“Localized resources can be mixed”，值设置为“yes”即可！
/// 拍照界面不是中文需要再project info language里面增加中文语言默认选择即可

/// 图片选择器组件
class ImagesPicker extends StatefulWidget {
  /// 多选
  final bool multiple;

  /// 多选数量
  final int limit;

  /// 最大尺寸
  final double? maxSize;

  /// 图片质量(0-100)
  final int imageQuality;

  /// 选择图片变化回调(外部通过此回调获取到图片文件信息)
  final ValueChanged<List<XFile>> onChanged;

  /// 感应的视图
  final Widget child;

  const ImagesPicker({
    super.key,
    this.multiple = true,
    this.limit = 9,
    this.maxSize = 2000,
    this.imageQuality = 90,
    required this.child,
    required this.onChanged
  });

  @override
  State<ImagesPicker> createState() => _ImagesPickerState();
}

class _ImagesPickerState extends State<ImagesPicker> {

  /// 创建图片选择器
  final ImagePicker _picker = ImagePicker();

  /// 通知外部变化
  _notifyChange(List<XFile> items) {
    widget.onChanged(items);
  }

  /// 拍照
  _takePhoto() async {
    try{
      XFile? xFile = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: widget.maxSize,
        maxHeight: widget.maxSize,
        imageQuality: widget.imageQuality,
      );
      if(xFile != null) {
        _notifyChange([xFile]);
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'camera_access_denied') {
        _showPermissionDeniedDialog("请前往设置页面开启相机访问权限");
      }
    }

  }

  /// 打开相册
  _openGallery() async {
    try{
      List<XFile?>? xFiles = widget.multiple && widget.limit > 1 ?  await _picker.pickMultiImage(
          maxWidth: widget.maxSize,
          maxHeight: widget.maxSize,
          imageQuality: widget.imageQuality,
          limit: widget.limit
      ) :  [await _picker.pickImage(
        maxWidth: widget.maxSize,
        maxHeight: widget.maxSize,
        imageQuality: widget.imageQuality,
        source: ImageSource.gallery,
      )];

      List<XFile> items = [];

      for(int i = 0; i < xFiles.length; i++){
        XFile? xFile = xFiles[i];
        /// 限制选择的文件(防止外面选择时没拦住，选择数量超过限制就不要了)
        if(xFile != null && items.length < widget.limit){
          items.add(xFile);
        } else {
          break;
        }
      }

      if(items.isNotEmpty)_notifyChange(items);
    } on PlatformException catch (e) {
      if (e.code == 'photo_access_denied') {
        _showPermissionDeniedDialog("请前往设置页面开启相册访问权限");
      }
    }

  }

  /// 提示开启权限
  void _showPermissionDeniedDialog(String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("权限请求"),
          content: Text(content),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildListItem(String text, [VoidCallback? onTap]) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text(text),
      ),
      onTap: () {
        Navigator.pop(context);
        if (onTap != null) {
          onTap();
        }
      },
    );
  }


  /// 显示底部操作按钮
  _showSheetAction() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        clipBehavior: Clip.antiAlias,
        // backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
        builder: (context) => SafeArea(
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.labelLarge?.color
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildListItem("拍照", _takePhoto),
                  const Divider(
                    height: 1,
                  ),
                  _buildListItem("从手机相册选择", _openGallery),
                  Container(
                    height: 8,
                    color: Theme.of(context).dividerColor.withOpacity(.05),
                  ),
                  _buildListItem("取消"),
                ],
              ),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _showSheetAction,
        child: widget.child
    );
  }
}
