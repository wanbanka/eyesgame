import 'package:flame/components.dart' show Vector2, PositionComponent;

import 'package:flame_forge2d/flame_forge2d.dart';

import '../../Backgrounds/ParallaxBackground.dart';

import '../../Platforms/Platform.dart';

import '../../../Models/Enums/Vertice.dart';

import '../../Sprites/SpriteGame.dart';

/**
 * System for collision detection and trajectory computing
 * (rebounds, parable...)
 */

mixin CollisionSystem on SpriteGame {
  Vector2 _velocity = Vector2.zero();

  Vector2 get velocity => this._velocity;

  set velocity(Vector2 value) => this._velocity = value;

/**
   * Handle the collision with the screen's boundaries
   */

  void handleBackgroundCollision(ParallaxBackground background) {
    bool isOnFloor, isOnLeft, isOnRight, isOnCeiling = false;

    Set<Vector2> chainVertices = {};

    background.contactBody!.body.fixtures.forEach((element) {
      EdgeShape edgeShape = element.shape as EdgeShape;

      chainVertices.addAll({edgeShape.vertex1, edgeShape.vertex2});
    });

    ChainShape chainShape = ChainShape()..createChain(chainVertices.toList());

    print(
        "Position of ${this.runtimeType}: ${this.contactBody!.body.position}");

    print("Vertices: ${chainShape.vertices}");
  }

  /**
   * Handle the collision with the platforms
   */

  void handlePlatformCollision(Platform platform) {
    platform.contactBody!.body.fixtures.forEach((element) {
      Map<Vertice, Vector2> vertices = _getVertices(element.shape);

      bool isOnPlatformWidth = vertices[Vertice.topLeft]!.x <=
              this.contactBody!.body.position.x &&
          this.contactBody!.body.position.x <= vertices[Vertice.topRight]!.x;

      bool isOnPlatform = isOnPlatformWidth &&
          this.contactBody!.body.position.y == vertices[Vertice.topRight]!.y;

      bool isUnderPlatform = isOnPlatformWidth &&
          this.contactBody!.body.position.y == vertices[Vertice.bottomLeft]!.y;
    });

    bool isOnPlatformWidth = (platform.x <= this.contactBody!.body.position.x &&
        this.contactBody!.body.position.x <=
            platform.x + platform.scaledSize.x);

    bool isOnPlatform =
        isOnPlatformWidth && this.contactBody!.body.position.y == platform.y;

    bool isUnderPlatform = isOnPlatformWidth &&
        this.contactBody!.body.position.y ==
            (platform.y + platform.scaledSize.y);

    if (isOnPlatform) {
      this.velocity = Vector2.zero();

      print("It's on");
    }

    if (isUnderPlatform) {
      print("It's under");
    }
  }

  /**
   * Get the list of a shape's vertices, in order to 
   * know where are the collisions
   */

  Map<Vertice, Vector2> _getVertices(Shape shape) {
    Map<Vertice, Vector2> vertices = {};

    switch (shape.runtimeType) {
      case PolygonShape:
        PolygonShape polygonShape = shape as PolygonShape;

        if (polygonShape.vertices.length == 4) {
          vertices.addAll({
            Vertice.topRight: polygonShape.vertices.first,
            Vertice.bottomRight: polygonShape.vertices[1],
            Vertice.bottomLeft: polygonShape.vertices[2],
            Vertice.topLeft: polygonShape.vertices.last
          });
        }

        break;

      case ChainShape:
        ChainShape chainShape = shape as ChainShape;

        if (chainShape.vertices.length == 4) {
          vertices.addAll({
            Vertice.topLeft: chainShape.vertex(0),
            Vertice.topRight: chainShape.vertex(1),
            Vertice.bottomLeft: chainShape.vertex(2),
            Vertice.bottomRight: chainShape.vertex(3)
          });
        }

        break;

      default:
        throw Exception("Shape must be PolygonShape or ChainShape");
        break;
    }

    return vertices;
  }

/**
 * Compute collisions according to the type of collidable
 * objects
 */

  void computeCollision(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (intersectionPoints.length == 2) {
      if (other is Platform) {
        handlePlatformCollision(other as Platform);
      } else if (other is ParallaxBackground) {
        handleBackgroundCollision(other as ParallaxBackground);
      }
    }
  }
}
