import 'package:flutter/material.dart';

import 'package:flame/util.dart';
import 'package:flutter/services.dart';

import 'package:cyberpunk_runner/cyberpunk.dart';

void main() { //async added to use await keyword
  //WidgetsFlutterBinding.ensureInitialized();

  CyberPunk game = CyberPunk();
  runApp(game.widget);

  // Create an instance of the util class
  Util flameUtil = Util(); 
  //await keyword added as these functions return Future
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.landscapeRight); //DevideOrientation requires flutter/services.dart 
}