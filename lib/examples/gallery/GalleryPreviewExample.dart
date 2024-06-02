
import 'package:flutter/material.dart';

import '../../widgets/gallery/gallery_images.dart';
import '../../widgets/gallery/images_preview.dart';


class GalleryPreviewExample extends StatefulWidget {
  const GalleryPreviewExample({super.key});

  @override
  State<GalleryPreviewExample> createState() => _GalleryPreviewExampleState();
}

class _GalleryPreviewExampleState extends State<GalleryPreviewExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("相册预览")),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text("只有小图"),
            GalleryImages(
              items: [
                ImagesPreviewItem(
                  lowSource: "https://pics6.baidu.com/feed/b812c8fcc3cec3fd2bc5308eea65c23185942749.jpeg@f_auto?token=fb540909b53bb6b72c78ea645db88c3a",
                  loadType: ImageLoadType.network,
                ),
                ImagesPreviewItem(
                  lowSource: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Flmg.jj20.com%2Fup%2Fallimg%2F811%2F040915120S0%2F150409120S0-5-1200.jpg&refer=http%3A%2F%2Flmg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664877788&t=f988985f5e99def89f35cec3ff68fc75",
                  loadType: ImageLoadType.network,
                ),
                ImagesPreviewItem(
                  lowSource: "https://pics0.baidu.com/feed/cc11728b4710b912ebf19043ff10ea0d93452251.jpeg@f_auto?token=1122369310a9ed2da6576786b78d02a5",
                  loadType: ImageLoadType.network,
                ),
                ImagesPreviewItem(
                  lowSource: "https://pics1.baidu.com/feed/6a600c338744ebf8d1efe0fd6e7bcf246259a7e3.jpeg@f_auto?token=1822438e4b53f9b3d9f16c5533876dcc",
                  loadType: ImageLoadType.network,
                ),
              ],
            ),

            Text("完整的相册展示"),
            GalleryImages(
              items: [
                ImagesPreviewItem(
                  id: "1_${DateTime.now().millisecondsSinceEpoch}",
                  lowSource: "https://gimg3.baidu.com/search/src=http%3A%2F%2Fpics1.baidu.com%2Ffeed%2Fb812c8fcc3cec3fd6a00ed5c49bdc331879427a4.jpeg%40f_auto%3Ftoken%3D29c27147662248bb0f7a048824b88d6d&refer=http%3A%2F%2Fwww.baidu.com&app=2021&size=f360,240&n=0&g=0n&q=75&fmt=auto?sec=1717434000&t=ae0a495f52476879147da7060064f105",
                  resource: "https://pics1.baidu.com/feed/3bf33a87e950352a30e5a321cc76ecfcb3118bd3.jpeg@f_auto?token=b6068b3be1cfd323f8300cc410a61b5f",
                  loadType: ImageLoadType.network,
                ),
                ImagesPreviewItem(
                  id: "2_${DateTime.now().millisecondsSinceEpoch}",
                  lowSource: "https://gimg3.baidu.com/search/src=http%3A%2F%2Fpics6.baidu.com%2Ffeed%2F3801213fb80e7becf52b81f83e3eaf369a506bd0.jpeg%40f_auto%3Ftoken%3Dc5e352db4916a6b3ea620a3ee3c9fd40&refer=http%3A%2F%2Fwww.baidu.com&app=2021&size=f360,240&n=0&g=0n&q=75&fmt=auto?sec=1717434000&t=6cf708858c7a367d292f5c9a58b38159",
                  resource: "https://pics6.baidu.com/feed/71cf3bc79f3df8dc169c6e88dc01648547102820.jpeg@f_auto?token=590259cb23914b11a11e99efef1c0964",
                  loadType: ImageLoadType.network,
                ),
                ImagesPreviewItem(
                  id: "3_${DateTime.now().millisecondsSinceEpoch}",
                  lowSource: "https://gimg3.baidu.com/search/src=http%3A%2F%2Fpics0.baidu.com%2Ffeed%2Fd62a6059252dd42a420fe238fab342bbc8eab8b2.jpeg%40f_auto%3Ftoken%3D389225680dc66656f83a18a656e3cbd0&refer=http%3A%2F%2Fwww.baidu.com&app=2021&size=f360,240&n=0&g=0n&q=75&fmt=auto?sec=1717434000&t=fb7f7bc09c34e5ceb6fa5841cdeb2749",
                  resource: "https://pics7.baidu.com/feed/f11f3a292df5e0fee09ab02ea6e82da65fdf72b1.jpeg@f_auto?token=d79abf447d7a1f0c64f9862ae5ab8e7c",
                  loadType: ImageLoadType.network,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}