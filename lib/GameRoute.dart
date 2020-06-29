import 'package:cyberpunk_runner/cyberpunk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CyberPunk cyberPunk = new CyberPunk();
    return WillPopScope(
      onWillPop: () async {
        return showDialog(
              context: context,
              builder: (context) => new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
                actions: <Widget>[
                  new GestureDetector(
                    onTap: () => Navigator.of(context).pop(false),
                    child: Text("NO"),
                  ),
                  SizedBox(height: 16),
                  new GestureDetector(
                    onTap: () => Navigator.of(context).pop(true),
                    child: Text("YES"),
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: Scaffold(
        body: cyberPunk.widget,
      ),
    );
  }
}
