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
      ..createFixture(FixtureDef(_getFixtureShape())..isSensor = false);
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
    Shape fixtureShape = PolygonShape();

    PositionComponent chooseBaseline = (hitbox.position != Vector2.zero() &&
            hitbox.scaledSize != Vector2.zero())
        ? hitbox
        : object;

    switch (hitbox.runtimeType) {
      case RectangleHitbox:
        fixtureShape = PolygonShape()
          ..set([
            chooseBaseline.position,
            Vector2(chooseBaseline.position.x + chooseBaseline.scaledSize.x,
                chooseBaseline.position.y),
            Vector2(chooseBaseline.position.x + chooseBaseline.scaledSize.x,
                chooseBaseline.position.y + chooseBaseline.scaledSize.y),
            Vector2(chooseBaseline.position.x,
                chooseBaseline.position.y + chooseBaseline.scaledSize.y)
          ]);
        break;

      case CircleHitbox:
        double addRadius = chooseBaseline.scaledSize.x / 2;

        fixtureShape = CircleShape()
          ..radius = addRadius
          ..getVertex(0).x = chooseBaseline.position.x + addRadius
          ..getVertex(0).y = chooseBaseline.position.y + addRadius;

        break;

      default:
    }

    return fixtureShape;
  }
}
