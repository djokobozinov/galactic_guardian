import 'package:flame/components.dart';
import 'package:galactic_guardian/components/galactic_guardian.dart';
import 'package:galactic_guardian/components/torpedo.dart';

class SpaceShip extends SpriteComponent
    with HasGameReference<GalacticGuardianGame> {
  late final SpawnComponent _torpedo;

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
    _torpedo = SpawnComponent(
      period: .2,
      selfPositioning: true,
      factory: (index) {
        return Torpedo(
          position: position +
              Vector2(
                0,
                -height / 2,
              ),
        );
      },
      autoStart: false,
    );

    game.add(_torpedo);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void launchTorpedos() {
    _torpedo.timer.start();
  }

  void stopTorpedos() {
    _torpedo.timer.stop();
  }
}
