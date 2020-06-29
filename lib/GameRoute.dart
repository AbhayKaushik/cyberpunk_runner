import 'package:cyberpunk_runner/cyberpunk.dart';
import 'package:cyberpunk_runner/mygame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MyGame cyberPunk = new MyGame(size);
    return WillPopScope(
      onWillPop: () async {
        return showDialog(
              context: context,
              builder: (context) => new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit the game'),
                actions: <Widget>[
                  new GestureDetector(
                    onTap: () => Navigator.of(context).pop(false),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("NO"),
                    ),
                  ),
                  SizedBox(height: 16),
                  new GestureDetector(
                    onTap: () => Navigator.of(context).pop(true),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("YES"),
                    ),
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
