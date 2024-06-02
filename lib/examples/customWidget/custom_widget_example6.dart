import 'package:flutter/material.dart';
import '../../widgets/done.dart';

class CustomWidgetExample6 extends StatefulWidget {
  final String title;

  const CustomWidgetExample6({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomWidgetExample6> createState() => _CustomWidgetExample6State();
}

class _CustomWidgetExample6State extends State<CustomWidgetExample6> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           DoneWidget(),
            DoneWidget(
              outline: true,
            ),
          ],
        ),
      )
    );
  }
}
