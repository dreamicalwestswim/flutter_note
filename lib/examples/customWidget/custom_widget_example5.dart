import 'package:flutter/material.dart';
import '../../widgets/custom_checkbox.dart';

class CustomWidgetExample5 extends StatefulWidget {
  final String title;

  const CustomWidgetExample5({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomWidgetExample5> createState() => _CustomWidgetExample5State();
}

class _CustomWidgetExample5State extends State<CustomWidgetExample5> with TickerProviderStateMixin {
  bool _checked = false;

  void _onChange(value) {
    setState(() => _checked = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CustomCheckbox(
                  strokeWidth: 1,
                  radius: 1,
                  value: _checked,
                  onChanged: _onChange,
                ),
              ),
            ),
            SizedBox(
              width: 30,
              height: 30,
              child: CustomCheckbox(
                strokeWidth: 3,
                radius: 3,
                value: _checked,
                onChanged: _onChange,
              ),
            ),
          ],
        ),
      )
    );
  }
}
