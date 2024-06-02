
import 'package:flutter/material.dart';

import '../../utils/DialogUtils.dart';

class DialogUtilsExample extends StatelessWidget {
  const DialogUtilsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DialogUtils使用")),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              DialogUtils.showAlertDialog(
                context: context,
                title: "Alert",
                content: "Are you sure you want to proceed?",
                onConfirm: () {

                },
                onCancel: () {


                },
              );
            },
            child: Text("Show Alert Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              DialogUtils.showSimpleDialog(
                context: context,
                title: "Choose an option",
                options: [
                  SimpleDialogOption(
                    onPressed: () {
                      DialogUtils.clearAllDialogs();
                      // Handle option 1 action
                    },
                    child: Text('Option 1'),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      DialogUtils.clearAllDialogs();
                      // Handle option 2 action
                    },
                    child: Text('Option 2'),
                  ),
                ],
              );
            },
            child: Text("Show Simple Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              DialogUtils.showAsyncDialog(
                context: context,
                dialogContent: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('This is an async dialog'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          DialogUtils.clearAllDialogs();
                          // Handle custom dialog action
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text("Show Async Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              DialogUtils.showLoadingDialog(
                context: context,
                loadingText: "Loading, please wait...",
              );
              Future.delayed(Duration(milliseconds: 1000), () {
                DialogUtils.clearAllDialogs();
              });
            },
            child: Text("Show Loading Dialog"),
          ),
          ElevatedButton(
            onPressed: () {
              DialogUtils.showBottomSheet(
                context: context,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text('This is a bottom sheet'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          DialogUtils.clearAllDialogs();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text("Show Bottom Sheet"),
          ),
          ElevatedButton(
            onPressed: () {
              DialogUtils.showSnackBar(
                context: context,
                content: 'This is a success message',
                type: SnackBarType.success,
              );
            },
            child: Text("Show Success SnackBar"),
          ),
          ElevatedButton(
            onPressed: () {
              DialogUtils.showSnackBar(
                context: context,
                content: 'This is an error message',
                type: SnackBarType.error,
              );
            },
            child: Text("Show Error SnackBar"),
          ),
          ElevatedButton(
            onPressed: () {
              DialogUtils.showSnackBar(
                context: context,
                content: 'This is a warning message',
                type: SnackBarType.warning,
              );
            },
            child: Text("Show Warning SnackBar"),
          ),
          ElevatedButton(
            onPressed: () {
              DialogUtils.showSnackBar(
                context: context,
                content: 'This is an info message',
                type: SnackBarType.info,
              );
            },
            child: Text("Show Info SnackBar"),
          ),
        ],
      ),
    );
  }
}