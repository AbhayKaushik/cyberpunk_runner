// import 'package:flutter/material.dart';

// import 'package:flame/util.dart';
// import 'package:flutter/services.dart';

// import 'package:cyberpunk_runner/cyberpunk.dart';

// void main() {
//   //async added to use await keyword
//   WidgetsFlutterBinding.ensureInitialized();

//   CyberPunk game = CyberPunk();
//   runApp(game.widget);

//   // Create an instance of the util class
//   Util flameUtil = Util();
//   //await keyword added as these functions return Future
//   flameUtil.fullScreen();
//   flameUtil.setOrientation(DeviceOrientation
//       .landscapeLeft); //DevideOrientation requires flutter/services.dart
// }
//---------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:flame/game.dart';
// import 'package:flame/flame.dart';
// import 'package:flame/components/animation_component.dart';
// import 'package:flame_scrolling_sprite/flame_scrolling_sprite.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Flame.util.fullScreen();
//   final size = await Flame.util.initialDimensions();
//   runApp(MyGame(size).widget);
// }

// class MyGame extends BaseGame {
//   final Size size;

//   MyGame(this.size) {
//     add(ScrollingSpriteComponent(
//       scrollingSprite: ScrollingSprite(
//         spritePath: 'desert/clouds.png',
//         width: size.width,
//         spriteDestWidth: 640,
//         spriteDestHeight: 160,
//         horizontalSpeed: -50,
//       ),
//       y: 40,
//     ));

//     add(ScrollingSpriteComponent(
//       scrollingSprite: ScrollingSprite(
//         spritePath: 'desert/mountains.png',
//         width: size.width,
//         spriteDestWidth: 640,
//         spriteDestHeight: 160,
//         height: size.height,
//         horizontalSpeed: -100,
//       ),
//       y: size.height - 180,
//     ));

//     add(ScrollingSpriteComponent(
//       scrollingSprite: ScrollingSprite(
//         spritePath: 'desert/ground.png',
//         width: size.width,
//         spriteDestWidth: 320,
//         spriteDestHeight: 160,
//         horizontalSpeed: -300,
//       ),
//       y: size.height - 160,
//     ));

//     add(AnimationComponent.sequenced(
//       192.0,
//       64.0,
//       'dino-run.png',
//       8,
//       textureWidth: 96.0,
//       textureHeight: 32.0,
//     )
//       ..y = size.height - 65
//       ..x = size.width / 2 - 96);

//     add(ScrollingSpriteComponent(
//       scrollingSprite: ScrollingSprite(
//         spritePath: 'desert/foreground.png',
//         width: size.width,
//         spriteDestWidth: 1280,
//         spriteDestHeight: 160,
//         height: size.height,
//         horizontalSpeed: -1500,
//       ),
//       y: size.height - 160,
//     ));
//   }

//   @override
//   Color backgroundColor() => const Color(0xFF73acb6);
// }
// ---------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flame_scrolling_sprite/flame_scrolling_sprite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  final size = await Flame.util.initialDimensions();
  runApp(MyGame(size).widget);
}

class MyGame extends Game {
  ScrollingSprite sprite;
  final Size size;

  MyGame(this.size) {
    sprite = ScrollingSprite(
      spritePath: 'far-buildings.png',
      height: size.height,
      width: size.width,
      //height: size.height,
      horizontalSpeed: -200,
      spriteDestWidth: 600,
      spriteDestHeight: 300,
    );
  }

  @override
  void update(double dt) {
    sprite.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (sprite.loaded()) {
      sprite.renderAt(0, 100, canvas);
    }
  }

  @override
  Color backgroundColor() => const Color(0xFF052c46);
}
