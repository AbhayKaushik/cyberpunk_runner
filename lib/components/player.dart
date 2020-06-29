import 'dart:ui';
import 'package:flame/anchor.dart';
import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/mixins/resizable.dart';

const SIZE = 52.0;

class Player extends AnimationComponent with Resizable {
  Player()
      : super.sequenced(SIZE, SIZE, 'dino-run.png', 2,
            textureWidth: 44, textureHeight: 47) {
    this.anchor = Anchor.center;
  }

  @override
  void resize(Size size) {
    super.resize(size);

    this.x = size.width / 4;
  }
}
