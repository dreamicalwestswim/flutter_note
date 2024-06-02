import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDatePickerExample extends StatefulWidget {
  final String title;

  const ShowDatePickerExample({Key? key, required this.title}) : super(key: key);

  @override
  State<ShowDatePickerExample> createState() => _ShowDatePickerExampleState();
}

class _ShowDatePickerExampleState extends State<ShowDatePickerExample> {
  Future<DateTime?> _showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        Duration(days: 30),
      ),
    );
  }

  Future<DateTime?> _showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          //点击该按钮后弹出对话框
          ElevatedButton(
            child: Text("android日历"),
            onPressed: () async {
              _showDatePicker1();
            },
          ),
          ElevatedButton(
            child: Text("ios日历"),
            onPressed: () async {
              _showDatePicker2();
            },
          ),
        ],
      ),
    );
  }
}
