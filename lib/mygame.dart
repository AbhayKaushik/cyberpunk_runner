import 'package:flame/gestures.dart';
import 'package:cyberpunk_runner/LandingRoute.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame_scrolling_sprite/flame_scrolling_sprite.dart';
import 'package:flutter/semantics.dart';

//const COLOR = const Color(0xFFAC204F);
//const SIZE = 52.0;
const GRAVITY = 400.0;
const JUMP = -350.0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setLandscapeLeftOnly();
  final size = await Flame.util.initialDimensions();
  runApp(MyGame(size).widget);
}

class Player extends AnimationComponent {
  double speedY = 0.0;
  double groundHeight = 0.0;
  bool jump = false;
  Player()
      : super.sequenced(256.0, 256.0, 'Run.png', 8,
            textureWidth: 200.0, textureHeight: 200.0) {
    this.x = 100;
  }

  reset(Size size) {
    this.y = size.height - 170;
    this.x = size.width / 10 - 50;
    speedY = 0.0;
  }

  @override
  void resize(Size size) {
    super.resize(size);
    reset(size);
    groundHeight = size.height - 170;
  }

  @override
  void update(double t) {
    super.update(t);
    if (jump) {
      this.y += speedY * t - GRAVITY * t * t / 2; //s = ut + (1/2) at^2
      this.speedY += GRAVITY * t; //v = u + at
      // if (y - groundHeight < 1.0 || y - groundHeight > -1.0) {
      //   //ground height
      //   y = groundHeight;
      //   //this.y = groundHeight;
      //   jump = false;
      // }
      if (y > groundHeight) {
        print("Exceeded");
        y = groundHeight;
        jump = false;
      }
    }
  }

  onTap() {
    if (!jump) {
      speedY = JUMP;
      print("Jummmp");
      jump = true;
    } else {
      print("Tap");
    }
  }
}

class MyGame extends BaseGame with TapDetector {
  Player player;
  final Size size;

  MyGame(this.size) {
    add(ScrollingSpriteComponent(
      scrollingSprite: ScrollingSprite(
        spritePath: 'far-buildings.png',
        width: size.width,
        spriteDestWidth: 640,
        spriteDestHeight: 320,
        horizontalSpeed: -50,
      ),
      y: 0,
    ));

    add(ScrollingSpriteComponent(
      scrollingSprite: ScrollingSprite(
        spritePath: 'back-buildings.png',
        width: size.width,
        spriteDestWidth: 640,
        spriteDestHeight: 320,
        height: size.height,
        horizontalSpeed: -100,
      ),
      y: size.height - 350,
    ));

    add(ScrollingSpriteComponent(
      scrollingSprite: ScrollingSprite(
        spritePath: 'foreground.png',
        width: size.width,
        spriteDestWidth: 320,
        spriteDestHeight: 200,
        horizontalSpeed: -300,
      ),
      y: size.height - 200,
    ));

    // add(AnimationComponent.sequenced(
    //   256.0,
    //   256.0,
    //   'Run.png',
    //   8,
    //   textureWidth: 200.0,
    //   textureHeight: 200.0,
    // )
    //   ..y = size.height - 170
    //   ..x = size.width / 10 - 50);
    add(player = Player());
    // add(ScrollingSpriteComponent(
    //   scrollingSprite: ScrollingSprite(
    //     spritePath: 'desert/foreground.png',
    //     width: size.width,
    //     spriteDestWidth: 1280,
    //     spriteDestHeight: 160,
    //     height: size.height,
    //     horizontalSpeed: -1500,
    //   ),
    //   y: size.height - 160,
    // ));
  }
  @override
  //Color backgroundColor() => const Color(0xFF73acb6);
  Color backgroundColor() => const Color(0xFF052c46);

  @override
  void onTap() {
    player.onTap();
  }
}