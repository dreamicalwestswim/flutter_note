import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class IOExample extends StatefulWidget {
  final String title;

  const IOExample({Key? key, required this.title}) : super(key: key);

  @override
  State<IOExample> createState() => _IOExampleState();
}

class _IOExampleState extends State<IOExample> {
  int _counter = 0;

  @override
  // void initState() {
  //   super.initState();
  //   //从文件读取点击次数
  //   _readCounter().then((int value) {
  //     setState(() {
  //       _counter = value;
  //     });
  //   });
  // }

  // Future<File> _getLocalFile() async {
  //   // 获取应用目录
  //   String dir = (await getApplicationDocumentsDirectory()).path;
  //   return File('$dir/counter.txt');
  // }

  // Future<int> _readCounter() async {
  //   try {
  //     File file = await _getLocalFile();
  //     // 读取点击次数（以字符串）
  //     String contents = await file.readAsString();
  //     return int.parse(contents);
  //   } on FileSystemException {
  //     return 0;
  //   }
  // }

  _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
   // await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
