import 'package:flame/components.dart' show Vector2, PositionComponent;

import 'package:flame_forge2d/flame_forge2d.dart';

import '../../Backgrounds/ParallaxBackground.dart';

import '../../Platforms/Platform.dart';

import '../../Sprites/Characters/Enemy.dart';
import '../../Sprites/Characters/Hero.dart';

import '../../../Models/Enums/Vertice.dart';

import '../Connections/ContactConnect.dart';

/**
 * System for collision detection and trajectory computing
 * (rebounds, parable...)
 */

mixin CollisionSystem on ContactConnect {
  Vector2 _velocity = Vector2.zero();

  Vector2 get velocity => this._velocity;

  set velocity(Vector2 value) => this._velocity = value;

  bool _isAloft = false;

  bool get isAloft => this._isAloft;

  set isAloft(bool value) => this._isAloft = value;

/**
   * Handle the collision with the screen's boundaries
   */

  void handleBackgroundCollision(ParallaxBackground background) {
    Set<Vector2> chainVertices = {};

    Map<Vertice, Vector2> contactBodyVert = _getVertices(getRealShape());

    print("Type : $runtimeType and vertices: $contactBodyVert");

    background.handleFixturesBody(fixtureCallback: (element) {
      EdgeShape edgeShape = element.shape as EdgeShape;

      chainVertices.addAll({edgeShape.vertex1, edgeShape.vertex2});
    });

    Map<Vertice, Vector2> chainShapeVertices =
        _getVertices(ChainShape()..createChain(chainVertices.toList()));

    print("Vertices of background: $chainShapeVertices");

    bool isOnCeiling = contactBodyVert[Vertice.topLeft]!.y ==
        chainShapeVertices[Vertice.topLeft]!.y;

    bool isOnFloor = contactBodyVert[Vertice.bottomLeft]!.y ==
        chainShapeVertices[Vertice.bottomLeft]!.y;

    if (isOnCeiling) {
      this.velocity = Vector2(0, 10);
      this.isAloft = true;
    }

    if (isOnFloor) {
      this.isAloft = false;
    }
  }

  /**
   * Handle the collision with the platforms
   */

  void handlePlatformCollision(Platform platform) {
    Map<Vertice, Vector2> contactBodyVert = _getVertices(getRealShape());

    print("Vertices of contactbody: $contactBodyVert");

    platform.handleFixturesBody(fixtureCallback: (element) {
      Map<Vertice, Vector2> vertices = _getVertices(element.shape);

      print("Platform vertices: $vertices");

      bool isOnPlatformWidth = (contactBodyVert[Vertice.bottomRight]!.x -
                  vertices[Vertice.topLeft]!.x >
              0) ||
          (vertices[Vertice.topRight]!.x -
                  contactBodyVert[Vertice.bottomLeft]!.x >
              0);

      bool isOnPlatform = isOnPlatformWidth &&
          contactBodyVert[Vertice.bottomRight]!.y ==
              vertices[Vertice.topRight]!.y;

      bool isUnderPlatform = isOnPlatformWidth &&
          contactBodyVert[Vertice.topLeft]!.y ==
              vertices[Vertice.bottomLeft]!.y;

      print(
          "Platform: ${vertices[Vertice.topRight]!.y} and Hero: ${contactBodyVert[Vertice.bottomRight]!.y}");

      if (isOnPlatform || isUnderPlatform) {
        this.velocity = Vector2.zero();

        this.isAloft = isUnderPlatform;
      }
    });

    print("Aloft ? : $isAloft");
  }

  /**
   * Handle the collision with enemies
   */

  void handleEnemyCollision(Enemy enemy) {
    enemy.stop();
  }

  /**
   * Handle the collision with the hero
   */

  void handleHeroCollision(Hero hero) {
    hero.velocity = Vector2(-100, -50);
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
            Vertice.bottomLeft: chainShape.vertex(3),
            Vertice.bottomRight: chainShape.vertex(2)
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
        handlePlatformCollision(other);
      } else if (other is ParallaxBackground) {
        handleBackgroundCollision(other);
      } else if (other is Enemy) {
        handleEnemyCollision(other);
      } else if (other is Hero) {
        handleHeroCollision(other);
      }
    }
  }
}
