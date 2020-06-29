import 'package:cyberpunk_runner/ColorPalette.dart';
import 'package:cyberpunk_runner/GameRoute.dart';
import 'package:cyberpunk_runner/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LaundingRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    landscapeModeOnly();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            ColorPalette.blue,
            ColorPalette.blueLight,
            ColorPalette.maroon,
            ColorPalette.crimson,
            ColorPalette.maroon,
            ColorPalette.blueLight,
            ColorPalette.blue
          ],
          stops: [0.5, 0.7, 0.72, 0.77, 0.8, 0.81, 0.82],
        ),
      ),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width * .5,
            child: Image.network(
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.itch.zone%2FaW1nLzE4MDU5MDAucG5n%2Foriginal%2F0onTij.png&f=1&nofb=1'),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    height: 45,
                    minWidth: 300,
                    buttonColor: Colors.purple,
                    child: RaisedButton(
                      textColor: Colors.white,
                      child: Text('Start Game'),
                      onPressed: () {
                        // Navigate to second route when tapped.
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GameRoute()),
                        );
                      },
                    ),
                  ),
                  ButtonTheme(
                    height: 45,
                    minWidth: 300,
                    buttonColor: Colors.purple,
                    child: RaisedButton(
                      textColor: Colors.white,
                      child: Text('About'),
                      onPressed: () {
                        // Navigate to second route when tapped.
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GameRoute()),
                        );
                      },
                    ),
                  ),
                  ButtonTheme(
                    height: 45,
                    minWidth: 300,
                    buttonColor: Colors.purple,
                    child: RaisedButton(
                      textColor: Colors.white,
                      child: Text('Settings'),
                      onPressed: () {
                        // Navigate to second route when tapped.
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GameRoute()),
                        );
                      },
                    ),
                  ),
                  ButtonTheme(
                    height: 45,
                    minWidth: 300,
                    buttonColor: Colors.purple,
                    child: RaisedButton(
                      textColor: Colors.white,
                      child: Text('Exit'),
                      onPressed: () {
                        // Navigate to second route when tapped.
                        SystemNavigator.pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
