import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/semantics.dart';

class CyberPunk extends Game { // Game class from Flame's game library

  Size screenSize;
  double tileSize;

  @override
  void render(Canvas canvas) { // Canvas class requires dart ui library
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