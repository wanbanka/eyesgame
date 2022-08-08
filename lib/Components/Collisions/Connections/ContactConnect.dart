import "package:flame/components.dart" show PositionComponent;

import 'package:flame_forge2d/flame_forge2d.dart' show Body;

import '../Bodies/ContactBody.dart';

/**
 * Include the contact body on a component
 */

mixin ContactConnect on PositionComponent {
  late ContactBody _contactBody;

  ContactBody get contactBody => _contactBody;

  Body get body => _contactBody.body;

  set contactBody(ContactBody value) => this._contactBody = value;
}
