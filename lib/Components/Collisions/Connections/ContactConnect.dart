import "package:flame/components.dart" show PositionComponent, Vector2;

import 'package:flame_forge2d/flame_forge2d.dart'
    show Body, Shape, PolygonShape, Fixture, World;

import '../Bodies/ContactBody.dart';

import '../../Sprites/Characters/Hero.dart';

/**
 * Include the contact body on a component
 */

mixin ContactConnect on PositionComponent {
  late ContactBody _contactBody;

  ContactBody get contactBody => _contactBody;

  Body get body => _contactBody.body;

  set contactBody(ContactBody value) => this._contactBody = value;

  /**
   * Get the shape of the contact body
   */

  Shape getRealShape() {
    if (runtimeType == Hero) {
      Vector2 realPosition =
          Vector2((this.body.position.x - 300), this.body.position.y)..round();

      return PolygonShape()
        ..set([
          realPosition,
          Vector2(realPosition.x, realPosition.y + this.scaledSize.y)..round(),
          Vector2(realPosition.x + this.scaledSize.x,
              realPosition.y + this.scaledSize.y)
            ..round(),
          Vector2(realPosition.x + this.scaledSize.x, realPosition.y)..round()
        ]);
    } else {
      return this.body.fixtures.first.shape;
    }
  }

  /**
   * Compute a callback for each fixture of the body
   */

  void handleFixturesBody(
      {required Function(Fixture fixture) fixtureCallback}) {
    this.body.fixtures.forEach((element) {
      fixtureCallback(element);
    });
  }

  /**
   * Clear a body from the screen
   */

  void destroyBody() {
    this.body.world.flags = ~World.locked;

    this.contactBody.removeAll(this.contactBody.children);

    this.body.world.destroyBody(body);

    this.body.world.flags = World.locked;
  }
}
