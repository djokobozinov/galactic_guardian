import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:galactic_guardian/components/space_ship.dart';

class GalacticGuardianGame extends FlameGame with PanDetector {
  late SpaceShip spaceShip;

  @override
  FutureOr<void> onLoad() async {
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('space_1.png'),
      ],
      baseVelocity: Vector2(0, -10),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );
    add(parallax);

    spaceShip = SpaceShip();
    add(spaceShip);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    spaceShip.move(info.delta.global);
  }

  @override
  void onPanStart(DragStartInfo info) {
    spaceShip.launchTorpedos();
  }

  @override
  void onPanEnd(DragEndInfo info) {
    spaceShip.stopTorpedos();
  }
}
