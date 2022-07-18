import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:flame/components.dart';

import 'package:flame/collisions.dart';

import 'package:flutter/material.dart' show Colors;

import '../Systems/CollisionSystem.dart';

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

    this.setColor(Colors.transparent);

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

    return world.createBody(BodyDef()
      ..userData = this
      ..type = isMoving ? BodyType.dynamic : BodyType.static
      ..bullet = isMoving)
      ..createFixture(FixtureDef(_getFixtureShape()));
  }

  @override
  void beginContact(Object other, Contact contact) {
    // TODO: implement beginContact
    super.beginContact(other, contact);

    print("Points of collisions: ${contact.manifold.points.length}");

    Set<Vector2> intersectionPoints =
        contact.manifold.points.map<Vector2>((p) => p.localPoint).toSet();

    if (object is CollisionSystem) {
      (object as CollisionSystem)
          .computeCollision(intersectionPoints, (other as ContactBody).object);
    }
  }

/**
 * Make a hitbox for an object
 */

  Shape _getFixtureShape() {
    dynamic chooseBaseline =
        (hitbox.position + hitbox.size != Vector2.zero()) ? hitbox : object;

    Shape fixtureShape = PolygonShape();

    switch (hitbox.runtimeType) {
      case RectangleHitbox:
        fixtureShape = PolygonShape()
          ..set([
            chooseBaseline.position,
            Vector2(chooseBaseline.position.x + chooseBaseline.width,
                chooseBaseline.position.y),
            Vector2(chooseBaseline.position.x + chooseBaseline.width,
                chooseBaseline.position.y + chooseBaseline.height),
            Vector2(chooseBaseline.position.x,
                chooseBaseline.position.y + chooseBaseline.height)
          ]);
        break;

      case CircleHitbox:
        fixtureShape = CircleShape()..radius = chooseBaseline.width / 2;
        break;

      default:
    }

    return fixtureShape;
  }
}
