import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:flame/components.dart';

import 'package:flame/collisions.dart';

/**
 * Body wrapping a Flame's component in order to 
 * detect closer collisions
 */

class ContactBody extends BodyComponent<Forge2DGame> with ContactCallbacks {
  ContactBody(
      {required this.object, required this.isMoving, required this.hitbox});

  PositionComponent object;

  bool isMoving;

  ShapeHitbox hitbox;

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad

    await add(this.object);

    return super.onLoad();
  }

  @override
  void onRemove() {
    // TODO: implement onRemove

    world.destroyBody(body);

    super.onRemove();
  }

  @override
  Body createBody() {
    // TODO: implement createBody

    Shape hitboxShape = PolygonShape();

    print("News on hitbox: ${hitbox.paint.strokeMiterLimit}");

    return world.createBody(BodyDef()
      ..userData = this
      ..type = isMoving ? BodyType.dynamic : BodyType.static
      ..bullet = isMoving)
      ..createFixture(FixtureDef(hitboxShape));
  }

  @override
  void beginContact(Object other, Contact contact) {
    // TODO: implement beginContact
    super.beginContact(other, contact);

    print("Points of collisions: ${contact.manifold.points}");
  }
}
