import 'dart:ui';
import 'package:cyberpunk_runner/cyberpunk.dart';

class Runner {
  final CyberPunk game;
  Rect runnerRect;
  Paint runnerPaint;

  Runner(this.game, double x, double y) {
    runnerRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    runnerPaint = Paint();
    runnerPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(runnerRect, runnerPaint);
  }

  void update(double t) {}
}
