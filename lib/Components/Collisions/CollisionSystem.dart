import 'package:flame/components.dart' show Vector2, PositionComponent;

/**
 * System for collision detection and trajectory computing
 * (rebounds, parable...)
 */

mixin CollisionSystem on PositionComponent {
  bool isOnGround = false;

  bool isOnWall = false;

  int touchedWalls = 0;

  Vector2 _velocity = Vector2.zero();

  Vector2 get velocity => this._velocity;

  set velocity(Vector2 value) => this._velocity = value;

/**
   * Handle the collision with the screen's boundaries
   */

  void handleScreenCollision(Set<Vector2> intersectionPoints) {
    final mid =
        (intersectionPoints.elementAt(0) + intersectionPoints.elementAt(1)) / 2;

    final collisionNormal = absoluteCenter - mid;

    double innerLeft = Vector2(1, 0).dot(collisionNormal.normalized());

    double innerRight = Vector2(-1, 0).dot(collisionNormal.normalized());

    print("Inners: $innerLeft, $innerRight");

    if (innerLeft > 0.9 || innerRight > 0.9) {
      this.isOnWall = true;
      this.touchedWalls += 1;
      this.isOnGround = false;
    }

    position -= collisionNormal.normalized().scaled(
        innerLeft > 0.9 ? -innerLeft : (innerRight > 0.9 ? -innerRight : 0));
  }

/**
   * Handle the collision with the floor and the platforms
   */

  void handleFloorCollision(Set<Vector2> intersectionPoints) {
    final mid =
        (intersectionPoints.elementAt(0) + intersectionPoints.elementAt(1)) / 2;

    final collisionNormal = absoluteCenter - mid;

    double inner = Vector2(0, -1).dot(collisionNormal.normalized());

    if (inner > 0.9) {
      this.isOnGround = true;
      this.isOnWall = false;
      this.touchedWalls = 0;
      this.velocity = Vector2.zero();
    }

    position += collisionNormal.normalized().scaled(inner);
  }
}
