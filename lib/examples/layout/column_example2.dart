import 'package:flutter/material.dart';


class ColumnExample2 extends StatefulWidget {
  final String title;

  const ColumnExample2({Key? key, required this.title}) : super(key: key);

  @override
  State<ColumnExample2> createState() => _ColumnExampleState();
}

class _ColumnExampleState extends State<ColumnExample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,//无效，内层Colum高度为实际高度
                      children: <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                        children: <Widget>[
                          Text("hello world "),
                          Text("I am Jack "),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      )
    );
  }
}
