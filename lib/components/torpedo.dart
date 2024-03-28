import 'package:flame/components.dart';
import 'package:galactic_guardian/components/galactic_guardian.dart';

class Torpedo extends SpriteAnimationComponent
    with HasGameReference<GalacticGuardianGame> {
  Torpedo({
    super.position,
  }) : super(
          size: Vector2(50, 50),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    animation = await game.loadSpriteAnimation(
      'torpedo_3.png',
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: .2,
        textureSize: Vector2(64, 64),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * -500;
    if (position.y < -height) {
      removeFromParent();
    }
  }
}
