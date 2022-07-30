import 'package:flame_forge2d/flame_forge2d.dart';

import 'package:flame/components.dart';

import 'package:flame/collisions.dart';

import '../Systems/CollisionSystem.dart';

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

    //this.setColor(Colors.transparent);

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

    Body makingBody = world.createBody(BodyDef()
      ..userData = this
      ..type = isMoving ? BodyType.dynamic : BodyType.static
      ..bullet = isMoving);

    _getFixtureHitbox().forEach((hitbox) {
      makingBody.createFixture(FixtureDef(hitbox)..isSensor = false);
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
        Vector2 newBaseline = chooseBaseline.position + Vector2(-363, -180);

        fixtureShapes.addAll([
          EdgeShape()
            ..set(
                newBaseline,
                Vector2(newBaseline.x + chooseBaseline.scaledSize.x,
                    newBaseline.y)),
          EdgeShape()
            ..set(
                Vector2(
                    newBaseline.x + chooseBaseline.scaledSize.x, newBaseline.y),
                Vector2(newBaseline.x + chooseBaseline.scaledSize.x,
                    newBaseline.y + (chooseBaseline.scaledSize.y - 40))),
          EdgeShape()
            ..set(
                Vector2(newBaseline.x,
                    newBaseline.y + (chooseBaseline.scaledSize.y - 40)),
                Vector2(newBaseline.x + chooseBaseline.scaledSize.x,
                    newBaseline.y + (chooseBaseline.scaledSize.y - 40))),
          EdgeShape()
            ..set(
                newBaseline,
                Vector2(newBaseline.x,
                    newBaseline.y + (chooseBaseline.scaledSize.y - 40)))
        ]);

        break;

      default:
    }

    return fixtureShapes;
  }
}
