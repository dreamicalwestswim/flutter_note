import 'package:flutter/material.dart';
import '../../widgets/gallery/gallery_picker.dart';


class GalleryPickerExample extends StatefulWidget {
  const GalleryPickerExample({super.key});

  @override
  State<GalleryPickerExample> createState() => _GalleryPickerExampleState();
}

class _GalleryPickerExampleState extends State<GalleryPickerExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("相册选择例子")),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            GalleryPicker(
              /// 图片发送变化
              onChanged: (items) {

              }
            )
          ],
        ),
      ),
    );
  }
}
