// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'CharFrame.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CharFrame _$CharFrameFromJson(Map<String, dynamic> json) {
  return _CharFrame.fromJson(json);
}

/// @nodoc
mixin _$CharFrame {
  @JsonKey(name: "src_image")
  String get srcImage => throw _privateConstructorUsedError;
  @JsonKey(name: "nb_sprites")
  int get nbSprites => throw _privateConstructorUsedError;
  @JsonKey(name: "step_time")
  double get stepTime => throw _privateConstructorUsedError;
  @JsonKey(name: "x")
  double get posX => throw _privateConstructorUsedError;
  @JsonKey(name: "y")
  double get posY => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharFrameCopyWith<CharFrame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharFrameCopyWith<$Res> {
  factory $CharFrameCopyWith(CharFrame value, $Res Function(CharFrame) then) =
      _$CharFrameCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "src_image") String srcImage,
      @JsonKey(name: "nb_sprites") int nbSprites,
      @JsonKey(name: "step_time") double stepTime,
      @JsonKey(name: "x") double posX,
      @JsonKey(name: "y") double posY});
}

/// @nodoc
class _$CharFrameCopyWithImpl<$Res> implements $CharFrameCopyWith<$Res> {
  _$CharFrameCopyWithImpl(this._value, this._then);

  final CharFrame _value;
  // ignore: unused_field
  final $Res Function(CharFrame) _then;

  @override
  $Res call({
    Object? srcImage = freezed,
    Object? nbSprites = freezed,
    Object? stepTime = freezed,
    Object? posX = freezed,
    Object? posY = freezed,
  }) {
    return _then(_value.copyWith(
      srcImage: srcImage == freezed
          ? _value.srcImage
          : srcImage // ignore: cast_nullable_to_non_nullable
              as String,
      nbSprites: nbSprites == freezed
          ? _value.nbSprites
          : nbSprites // ignore: cast_nullable_to_non_nullable
              as int,
      stepTime: stepTime == freezed
          ? _value.stepTime
          : stepTime // ignore: cast_nullable_to_non_nullable
              as double,
      posX: posX == freezed
          ? _value.posX
          : posX // ignore: cast_nullable_to_non_nullable
              as double,
      posY: posY == freezed
          ? _value.posY
          : posY // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_CharFrameCopyWith<$Res> implements $CharFrameCopyWith<$Res> {
  factory _$$_CharFrameCopyWith(
          _$_CharFrame value, $Res Function(_$_CharFrame) then) =
      __$$_CharFrameCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "src_image") String srcImage,
      @JsonKey(name: "nb_sprites") int nbSprites,
      @JsonKey(name: "step_time") double stepTime,
      @JsonKey(name: "x") double posX,
      @JsonKey(name: "y") double posY});
}

/// @nodoc
class __$$_CharFrameCopyWithImpl<$Res> extends _$CharFrameCopyWithImpl<$Res>
    implements _$$_CharFrameCopyWith<$Res> {
  __$$_CharFrameCopyWithImpl(
      _$_CharFrame _value, $Res Function(_$_CharFrame) _then)
      : super(_value, (v) => _then(v as _$_CharFrame));

  @override
  _$_CharFrame get _value => super._value as _$_CharFrame;

  @override
  $Res call({
    Object? srcImage = freezed,
    Object? nbSprites = freezed,
    Object? stepTime = freezed,
    Object? posX = freezed,
    Object? posY = freezed,
  }) {
    return _then(_$_CharFrame(
      srcImage: srcImage == freezed
          ? _value.srcImage
          : srcImage // ignore: cast_nullable_to_non_nullable
              as String,
      nbSprites: nbSprites == freezed
          ? _value.nbSprites
          : nbSprites // ignore: cast_nullable_to_non_nullable
              as int,
      stepTime: stepTime == freezed
          ? _value.stepTime
          : stepTime // ignore: cast_nullable_to_non_nullable
              as double,
      posX: posX == freezed
          ? _value.posX
          : posX // ignore: cast_nullable_to_non_nullable
              as double,
      posY: posY == freezed
          ? _value.posY
          : posY // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CharFrame extends _CharFrame with DiagnosticableTreeMixin {
  _$_CharFrame(
      {@JsonKey(name: "src_image") required this.srcImage,
      @JsonKey(name: "nb_sprites") required this.nbSprites,
      @JsonKey(name: "step_time") this.stepTime = 0.1,
      @JsonKey(name: "x") this.posX = 0.0,
      @JsonKey(name: "y") this.posY = 0.0})
      : super._();

  factory _$_CharFrame.fromJson(Map<String, dynamic> json) =>
      _$$_CharFrameFromJson(json);

  @override
  @JsonKey(name: "src_image")
  final String srcImage;
  @override
  @JsonKey(name: "nb_sprites")
  final int nbSprites;
  @override
  @JsonKey(name: "step_time")
  final double stepTime;
  @override
  @JsonKey(name: "x")
  final double posX;
  @override
  @JsonKey(name: "y")
  final double posY;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CharFrame(srcImage: $srcImage, nbSprites: $nbSprites, stepTime: $stepTime, posX: $posX, posY: $posY)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CharFrame'))
      ..add(DiagnosticsProperty('srcImage', srcImage))
      ..add(DiagnosticsProperty('nbSprites', nbSprites))
      ..add(DiagnosticsProperty('stepTime', stepTime))
      ..add(DiagnosticsProperty('posX', posX))
      ..add(DiagnosticsProperty('posY', posY));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharFrame &&
            const DeepCollectionEquality().equals(other.srcImage, srcImage) &&
            const DeepCollectionEquality().equals(other.nbSprites, nbSprites) &&
            const DeepCollectionEquality().equals(other.stepTime, stepTime) &&
            const DeepCollectionEquality().equals(other.posX, posX) &&
            const DeepCollectionEquality().equals(other.posY, posY));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(srcImage),
      const DeepCollectionEquality().hash(nbSprites),
      const DeepCollectionEquality().hash(stepTime),
      const DeepCollectionEquality().hash(posX),
      const DeepCollectionEquality().hash(posY));

  @JsonKey(ignore: true)
  @override
  _$$_CharFrameCopyWith<_$_CharFrame> get copyWith =>
      __$$_CharFrameCopyWithImpl<_$_CharFrame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharFrameToJson(this);
  }
}

abstract class _CharFrame extends CharFrame {
  factory _CharFrame(
      {@JsonKey(name: "src_image") required final String srcImage,
      @JsonKey(name: "nb_sprites") required final int nbSprites,
      @JsonKey(name: "step_time") final double stepTime,
      @JsonKey(name: "x") final double posX,
      @JsonKey(name: "y") final double posY}) = _$_CharFrame;
  _CharFrame._() : super._();

  factory _CharFrame.fromJson(Map<String, dynamic> json) =
      _$_CharFrame.fromJson;

  @override
  @JsonKey(name: "src_image")
  String get srcImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "nb_sprites")
  int get nbSprites => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "step_time")
  double get stepTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "x")
  double get posX => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "y")
  double get posY => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CharFrameCopyWith<_$_CharFrame> get copyWith =>
      throw _privateConstructorUsedError;
}
