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
    final collisionNormal = _getNormalCollision(intersectionPoints);

    double innerLeft = Vector2(1, 0).dot(collisionNormal);

    double innerRight = Vector2(-1, 0).dot(collisionNormal);

    if (innerLeft > 0.9 || innerRight > 0.9) {
      this.isOnWall = true;
      this.touchedWalls += 1;
      this.isOnGround = false;
    }

    position -= collisionNormal.scaled(
        innerLeft > 0.9 ? -innerLeft : (innerRight > 0.9 ? -innerRight : 0));
  }

/**
   * Handle the collision with the floor and the platforms
   */

  void handleFloorCollision(Set<Vector2> intersectionPoints) {
    final collisionNormal = _getNormalCollision(intersectionPoints);

    double inner = Vector2(0, -1).dot(collisionNormal);

    print("Inner prod floor: $inner");

    if (inner > 0.79 || inner > -0.25) {
      position += collisionNormal.scaled(inner);

      if (inner > 0.79) {
        this.isOnGround = true;
        this.isOnWall = false;
        this.touchedWalls = 0;
        this.velocity = Vector2.zero();
      }
    }
  }

  /**
   * Compute the collision's point between two components
   */

  Vector2 _getNormalCollision(Set<Vector2> intersectionPoints) {
    return (absoluteCenter -
            ((intersectionPoints.elementAt(0) +
                    intersectionPoints.elementAt(1)) /
                2))
        .normalized();
  }
}
