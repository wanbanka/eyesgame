import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:flame/components.dart';

import 'package:flame/collisions.dart';

import '../Systems/CollisionSystem.dart';

import 'package:flutter/material.dart' show Colors;

/**
 * Body wrapping a Flame's component in order to 
 * detect closer collisions
 */

class ContactBody extends BodyComponent<Forge2DGame> with ContactCallbacks {
  ContactBody(
      {required this.object, required this.isMoving, required this.hitbox});

  PositionComponent object;

  PositionComponent hitbox;

  bool isMoving;

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

    this.removeAll(this.children);

    super.onRemove();
  }

  @override
  Body createBody() {
    // TODO: implement createBody

    print("Type of object: ${object.runtimeType}");

    print(
        "Positions: Object: ${this.object.position} and Hitbox: ${this.hitbox.position}");

    Body makingBody = world.createBody(BodyDef()
      ..userData = this
      ..type = isMoving ? BodyType.dynamic : BodyType.static
      ..bullet = isMoving);

    print("Position of body component: ${makingBody.position}");

    _getFixtureHitbox().forEach((hitbox) {
      makingBody.createFixture(FixtureDef(hitbox));
    });

    return makingBody;
  }

  @override
  void beginContact(Object other, Contact contact) {
    // TODO: implement beginContact
    super.beginContact(other, contact);

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

  List<Shape> _getFixtureHitbox() {
    List<Shape> fixtureShapes = [];

    PositionComponent chooseBaseline = (hitbox.position != Vector2.zero() &&
            hitbox.scaledSize != Vector2.zero())
        ? hitbox
        : object;

    switch (hitbox.runtimeType) {
      case RectangleHitbox:
        fixtureShapes.add(PolygonShape()
          ..set([
            chooseBaseline.position,
            Vector2(chooseBaseline.position.x + chooseBaseline.scaledSize.x,
                chooseBaseline.position.y),
            Vector2(chooseBaseline.position.x + chooseBaseline.scaledSize.x,
                chooseBaseline.position.y + chooseBaseline.scaledSize.y),
            Vector2(chooseBaseline.position.x,
                chooseBaseline.position.y + chooseBaseline.scaledSize.y)
          ]));

        break;

      case CircleHitbox:
        double addRadius = chooseBaseline.scaledSize.x / 2;

        fixtureShapes.add(CircleShape()
          ..radius = addRadius
          ..getVertex(0).x = chooseBaseline.position.x + addRadius
          ..getVertex(0).y = chooseBaseline.position.y + addRadius);

        break;

      case ScreenHitbox:
        fixtureShapes.addAll([
          EdgeShape()
            ..set(
                chooseBaseline.position,
                Vector2(chooseBaseline.position.x + chooseBaseline.scaledSize.x,
                    chooseBaseline.position.y)
                  ..round()),
          EdgeShape()
            ..set(
                Vector2(chooseBaseline.position.x + chooseBaseline.scaledSize.x,
                    chooseBaseline.position.y)
                  ..round(),
                Vector2(
                    chooseBaseline.position.x + chooseBaseline.scaledSize.x,
                    chooseBaseline.position.y +
                        (chooseBaseline.scaledSize.y - 40))
                  ..round()),
          EdgeShape()
            ..set(
                Vector2(
                    chooseBaseline.position.x,
                    chooseBaseline.position.y +
                        (chooseBaseline.scaledSize.y - 40))
                  ..round(),
                Vector2(
                    chooseBaseline.position.x + chooseBaseline.scaledSize.x,
                    chooseBaseline.position.y +
                        (chooseBaseline.scaledSize.y - 40))
                  ..round()),
          EdgeShape()
            ..set(
                chooseBaseline.position,
                Vector2(
                    chooseBaseline.position.x,
                    chooseBaseline.position.y +
                        (chooseBaseline.scaledSize.y - 40))
                  ..round())
        ]);

        break;

      default:
    }

    return fixtureShapes;
  }
}
