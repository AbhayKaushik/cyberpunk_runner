import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';

const COLOR = const Color(0xFFAC204F);
const SIZE = 52.0;
const GRAVITY = 400.0;
const JUMP = -300.0;

class CyberPunk extends Game {
  // Game class from Flame's game library

  Size screenSize;
  double tileSize;

  // CyberPunk() {
  //   initialize();
  // }

  // void initialize async{
  //   resize(await Flame.util.initialDimensions);
  // }

  @override
  void render(Canvas canvas) {
    // Canvas class requires dart ui library
    //Note: Render bottom-up as later renders come on top
    // Render background
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xFFAC204F); //0xaarrggbb
    canvas.drawRect(bgRect, bgPaint);
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
    tileSize = screenSize.height / 9;
  }
}
