import 'package:flame/components.dart';

import 'Character.dart';

import '../../../Models/Enums/Status.dart';

/**
 * Define all characteristics of the hero
 */

class Hero extends Character {
  Hero({required spriteSheet}) : super(spriteSheet: spriteSheet) {
    this.current = Status.profile;
  }

  @override
  void move() {}
}
