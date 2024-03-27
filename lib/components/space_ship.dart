import 'package:flame/components.dart';
import 'package:galactic_guardian/components/galactic_guardian.dart';

class SpaceShip extends SpriteComponent
    with HasGameReference<GalacticGuardianGame> {
  SpaceShip()
      : super(
          size: Vector2(50, 90),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await game.loadSprite('space_ship.png');
    position = game.size / 2;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
