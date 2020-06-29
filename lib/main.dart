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
// import 'package:flame/gestures.dart';
// import 'package:cyberpunk_runner/LandingRoute.dart';
// import 'package:flutter/material.dart';
// import 'package:flame/game.dart';
// import 'package:flame/flame.dart';
// import 'package:flame/components/animation_component.dart';
// import 'package:flame_scrolling_sprite/flame_scrolling_sprite.dart';
// import 'package:flutter/semantics.dart';

// //const COLOR = const Color(0xFFAC204F);
// //const SIZE = 52.0;
// const GRAVITY = 400.0;
// const JUMP = -350.0;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Flame.util.fullScreen();
//   await Flame.util.setLandscapeLeftOnly();
//   final size = await Flame.util.initialDimensions();
//   runApp(MyGame(size).widget);
// }

// class Player extends AnimationComponent {
//   double speedY = 0.0;
//   double groundHeight = 0.0;
//   bool jump = false;
//   Player()
//       : super.sequenced(256.0, 256.0, 'Run.png', 8,
//             textureWidth: 200.0, textureHeight: 200.0) {
//     this.x = 100;
//   }

//   reset(Size size) {
//     this.y = size.height - 170;
//     this.x = size.width / 10 - 50;
//     speedY = 0.0;
//   }

//   @override
//   void resize(Size size) {
//     super.resize(size);
//     reset(size);
//     groundHeight = size.height - 170;
//   }

//   @override
//   void update(double t) {
//     super.update(t);
//     if (jump) {
//       this.y += speedY * t - GRAVITY * t * t / 2; //s = ut + (1/2) at^2
//       this.speedY += GRAVITY * t; //v = u + at
//       // if (y - groundHeight < 1.0 || y - groundHeight > -1.0) {
//       //   //ground height
//       //   y = groundHeight;
//       //   //this.y = groundHeight;
//       //   jump = false;
//       // }
//       if (y > groundHeight) {
//         print("Exceeded");
//         y = groundHeight;
//         jump = false;
//       }
//     }
//   }

//   onTap() {
//     if (!jump) {
//       speedY = JUMP;
//       print("Jummmp");
//       jump = true;
//     } else {
//       print("Tap");
//     }
//   }
// }

// class MyGame extends BaseGame with TapDetector {
//   Player player;
//   final Size size;

//   MyGame(this.size) {
//     add(ScrollingSpriteComponent(
//       scrollingSprite: ScrollingSprite(
//         spritePath: 'far-buildings.png',
//         width: size.width,
//         spriteDestWidth: 640,
//         spriteDestHeight: 320,
//         horizontalSpeed: -50,
//       ),
//       y: 0,
//     ));

//     add(ScrollingSpriteComponent(
//       scrollingSprite: ScrollingSprite(
//         spritePath: 'back-buildings.png',
//         width: size.width,
//         spriteDestWidth: 640,
//         spriteDestHeight: 320,
//         height: size.height,
//         horizontalSpeed: -100,
//       ),
//       y: size.height - 350,
//     ));

//     add(ScrollingSpriteComponent(
//       scrollingSprite: ScrollingSprite(
//         spritePath: 'foreground.png',
//         width: size.width,
//         spriteDestWidth: 320,
//         spriteDestHeight: 200,
//         horizontalSpeed: -300,
//       ),
//       y: size.height - 200,
//     ));

//     // add(AnimationComponent.sequenced(
//     //   256.0,
//     //   256.0,
//     //   'Run.png',
//     //   8,
//     //   textureWidth: 200.0,
//     //   textureHeight: 200.0,
//     // )
//     //   ..y = size.height - 170
//     //   ..x = size.width / 10 - 50);
//     add(player = Player());
//     // add(ScrollingSpriteComponent(
//     //   scrollingSprite: ScrollingSprite(
//     //     spritePath: 'desert/foreground.png',
//     //     width: size.width,
//     //     spriteDestWidth: 1280,
//     //     spriteDestHeight: 160,
//     //     height: size.height,
//     //     horizontalSpeed: -1500,
//     //   ),
//     //   y: size.height - 160,
//     // ));
//   }
//   @override
//   //Color backgroundColor() => const Color(0xFF73acb6);
//   Color backgroundColor() => const Color(0xFF052c46);

//   @override
//   void onTap() {
//     player.onTap();
//   }
// }
// ---------------------------------------------------------

// import 'package:cyberpunk_runner/components/player.dart';
// import 'package:flutter/material.dart';
// import 'package:flame/game.dart';
// import 'package:flame/flame.dart';
// import 'package:flame_scrolling_sprite/flame_scrolling_sprite.dart';
// import 'package:flame/components/animation_component.dart';

// import 'package:flame/anchor.dart';
// import 'package:flame/components/animation_component.dart';
// import 'package:flame/components/mixins/resizable.dart';

// //import 'components/player.dart';
// const SIZE = 52.0;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Flame.util.fullScreen();
//   final size = await Flame.util.initialDimensions();
//   runApp(MyGame(size).widget);
// }

// class MyGame extends BaseGame {
//   ScrollingSprite sprite;
//   final Size size;

//   MyGame(this.size) {
//     //add(Player());
//     sprite = ScrollingSprite(
//       spritePath: 'far-buildings.png',
//       height: size.height,
//       width: size.width,
//       //height: size.height,
//       horizontalSpeed: -200,
//       spriteDestWidth: 600,
//       spriteDestHeight: 300,
//     );
//     add(AnimationComponent.sequenced(
//       SIZE,
//       SIZE,
//       'dino-run.png',
//       2,
//       textureWidth: 44,
//       textureHeight: 47,
//     )
//       ..y = size.height - 100
//       ..x = 60);
//     add(Player());
//   }

//   // @override
//   // void update(double dt) {
//   //   sprite.update(dt);
//   // }

//   // @override
//   // void render(Canvas canvas) {
//   //   if (sprite.loaded()) {
//   //     sprite.renderAt(0, 100, canvas);
//   //   }
//   // }

//   @override
//   //Color backgroundColor() => const Color(0xFF052c46);
//   Color backgroundColor() => const Color(0xFFFFFFFF);
// }

// class Player extends AnimationComponent with Resizable {
//   Player()
//       : super.sequenced(SIZE, SIZE, 'dino-run.png', 2,
//             textureWidth: 44, textureHeight: 47) {
//     this.anchor = Anchor.center;
//   }

//   @override
//   void update(double t) {
//     // TODO: implement update
//     super.update(t);
//   }

//   @override
//   void resize(Size size) {
//     super.resize(size);

import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
//import 'package:cyberpunk_runner/cyberpunk.dart';
import 'package:cyberpunk_runner/LandingRoute.dart';
import 'package:cyberpunk_runner/mygame.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: LaundingRoute(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

void main() {
  //async added to use await keyword
  //WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());

  // Create an instance of the util class
  Util flameUtil = Util();
  //await keyword added as these functions return Future
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation
      .landscapeLeft); //DevideOrientation requires flutter/services.dart
}
