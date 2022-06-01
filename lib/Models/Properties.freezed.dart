// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'Properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Properties _$PropertiesFromJson(Map<String, dynamic> json) {
  return _Properties.fromJson(json);
}

/// @nodoc
mixin _$Properties {
  Map<String, CharFrame> get sprites => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "background_image")
  String get backgroundImage => throw _privateConstructorUsedError;
  @JsonKey(name: "floor_image")
  String get floorImage => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertiesCopyWith<Properties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertiesCopyWith<$Res> {
  factory $PropertiesCopyWith(
          Properties value, $Res Function(Properties) then) =
      _$PropertiesCopyWithImpl<$Res>;
  $Res call(
      {Map<String, CharFrame> sprites,
      String name,
      @JsonKey(name: "background_image") String backgroundImage,
      @JsonKey(name: "floor_image") String floorImage,
      int speed});
}

/// @nodoc
class _$PropertiesCopyWithImpl<$Res> implements $PropertiesCopyWith<$Res> {
  _$PropertiesCopyWithImpl(this._value, this._then);

  final Properties _value;
  // ignore: unused_field
  final $Res Function(Properties) _then;

  @override
  $Res call({
    Object? sprites = freezed,
    Object? name = freezed,
    Object? backgroundImage = freezed,
    Object? floorImage = freezed,
    Object? speed = freezed,
  }) {
    return _then(_value.copyWith(
      sprites: sprites == freezed
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as Map<String, CharFrame>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String,
      floorImage: floorImage == freezed
          ? _value.floorImage
          : floorImage // ignore: cast_nullable_to_non_nullable
              as String,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PropertiesCopyWith<$Res>
    implements $PropertiesCopyWith<$Res> {
  factory _$$_PropertiesCopyWith(
          _$_Properties value, $Res Function(_$_Properties) then) =
      __$$_PropertiesCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, CharFrame> sprites,
      String name,
      @JsonKey(name: "background_image") String backgroundImage,
      @JsonKey(name: "floor_image") String floorImage,
      int speed});
}

/// @nodoc
class __$$_PropertiesCopyWithImpl<$Res> extends _$PropertiesCopyWithImpl<$Res>
    implements _$$_PropertiesCopyWith<$Res> {
  __$$_PropertiesCopyWithImpl(
      _$_Properties _value, $Res Function(_$_Properties) _then)
      : super(_value, (v) => _then(v as _$_Properties));

  @override
  _$_Properties get _value => super._value as _$_Properties;

  @override
  $Res call({
    Object? sprites = freezed,
    Object? name = freezed,
    Object? backgroundImage = freezed,
    Object? floorImage = freezed,
    Object? speed = freezed,
  }) {
    return _then(_$_Properties(
      sprites: sprites == freezed
          ? _value._sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as Map<String, CharFrame>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundImage: backgroundImage == freezed
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as String,
      floorImage: floorImage == freezed
          ? _value.floorImage
          : floorImage // ignore: cast_nullable_to_non_nullable
              as String,
      speed: speed == freezed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Properties extends _Properties with DiagnosticableTreeMixin {
  _$_Properties(
      {final Map<String, CharFrame> sprites = const {},
      this.name = "",
      @JsonKey(name: "background_image") this.backgroundImage = "",
      @JsonKey(name: "floor_image") this.floorImage = "",
      this.speed = 0})
      : _sprites = sprites,
        super._();

  factory _$_Properties.fromJson(Map<String, dynamic> json) =>
      _$$_PropertiesFromJson(json);

  final Map<String, CharFrame> _sprites;
  @override
  @JsonKey()
  Map<String, CharFrame> get sprites {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sprites);
  }

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: "background_image")
  final String backgroundImage;
  @override
  @JsonKey(name: "floor_image")
  final String floorImage;
  @override
  @JsonKey()
  final int speed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Properties(sprites: $sprites, name: $name, backgroundImage: $backgroundImage, floorImage: $floorImage, speed: $speed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Properties'))
      ..add(DiagnosticsProperty('sprites', sprites))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('backgroundImage', backgroundImage))
      ..add(DiagnosticsProperty('floorImage', floorImage))
      ..add(DiagnosticsProperty('speed', speed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Properties &&
            const DeepCollectionEquality().equals(other._sprites, _sprites) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.backgroundImage, backgroundImage) &&
            const DeepCollectionEquality()
                .equals(other.floorImage, floorImage) &&
            const DeepCollectionEquality().equals(other.speed, speed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sprites),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(backgroundImage),
      const DeepCollectionEquality().hash(floorImage),
      const DeepCollectionEquality().hash(speed));

  @JsonKey(ignore: true)
  @override
  _$$_PropertiesCopyWith<_$_Properties> get copyWith =>
      __$$_PropertiesCopyWithImpl<_$_Properties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PropertiesToJson(this);
  }
}

abstract class _Properties extends Properties {
  factory _Properties(
      {final Map<String, CharFrame> sprites,
      final String name,
      @JsonKey(name: "background_image") final String backgroundImage,
      @JsonKey(name: "floor_image") final String floorImage,
      final int speed}) = _$_Properties;
  _Properties._() : super._();

  factory _Properties.fromJson(Map<String, dynamic> json) =
      _$_Properties.fromJson;

  @override
  Map<String, CharFrame> get sprites => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "background_image")
  String get backgroundImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "floor_image")
  String get floorImage => throw _privateConstructorUsedError;
  @override
  int get speed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PropertiesCopyWith<_$_Properties> get copyWith =>
      throw _privateConstructorUsedError;
}
