import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/gameback.jpeg'), fit: BoxFit.fill),
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * .5,
              child: Center(
                child: Text(
                  'About',
                  style: TextStyle(
                      fontFamily: 'ThaleahFat_TTF',
                      fontSize: 52,
                      color: Colors.white),
                ),
              )),
          Container(
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction: Axis.vertical,
              children: <Widget>[
                Text(
                  "This was made by Abhay Kaushik\nand Kunal Raghav in FlutterHack20",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      backgroundColor: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
