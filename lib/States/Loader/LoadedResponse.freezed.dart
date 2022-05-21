// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'LoadedResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoadedResponse _$LoadedResponseFromJson(Map<String, dynamic> json) {
  return _LoadedResponse.fromJson(json);
}

/// @nodoc
mixin _$LoadedResponse {
  String get name => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedResponseCopyWith<LoadedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadedResponseCopyWith<$Res> {
  factory $LoadedResponseCopyWith(
          LoadedResponse value, $Res Function(LoadedResponse) then) =
      _$LoadedResponseCopyWithImpl<$Res>;
  $Res call({String name, Map<String, dynamic> attributes});
}

/// @nodoc
class _$LoadedResponseCopyWithImpl<$Res>
    implements $LoadedResponseCopyWith<$Res> {
  _$LoadedResponseCopyWithImpl(this._value, this._then);

  final LoadedResponse _value;
  // ignore: unused_field
  final $Res Function(LoadedResponse) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$$_LoadedResponseCopyWith<$Res>
    implements $LoadedResponseCopyWith<$Res> {
  factory _$$_LoadedResponseCopyWith(
          _$_LoadedResponse value, $Res Function(_$_LoadedResponse) then) =
      __$$_LoadedResponseCopyWithImpl<$Res>;
  @override
  $Res call({String name, Map<String, dynamic> attributes});
}

/// @nodoc
class __$$_LoadedResponseCopyWithImpl<$Res>
    extends _$LoadedResponseCopyWithImpl<$Res>
    implements _$$_LoadedResponseCopyWith<$Res> {
  __$$_LoadedResponseCopyWithImpl(
      _$_LoadedResponse _value, $Res Function(_$_LoadedResponse) _then)
      : super(_value, (v) => _then(v as _$_LoadedResponse));

  @override
  _$_LoadedResponse get _value => super._value as _$_LoadedResponse;

  @override
  $Res call({
    Object? name = freezed,
    Object? attributes = freezed,
  }) {
    return _then(_$_LoadedResponse(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LoadedResponse extends _LoadedResponse with DiagnosticableTreeMixin {
  _$_LoadedResponse(
      {this.name = "default", final Map<String, dynamic> attributes = const {}})
      : _attributes = attributes,
        super._();

  factory _$_LoadedResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LoadedResponseFromJson(json);

  @override
  @JsonKey()
  final String name;
  final Map<String, dynamic> _attributes;
  @override
  @JsonKey()
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadedResponse(name: $name, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoadedResponse'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('attributes', attributes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedResponse &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedResponseCopyWith<_$_LoadedResponse> get copyWith =>
      __$$_LoadedResponseCopyWithImpl<_$_LoadedResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoadedResponseToJson(this);
  }
}

abstract class _LoadedResponse extends LoadedResponse {
  factory _LoadedResponse(
      {final String name,
      final Map<String, dynamic> attributes}) = _$_LoadedResponse;
  _LoadedResponse._() : super._();

  factory _LoadedResponse.fromJson(Map<String, dynamic> json) =
      _$_LoadedResponse.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedResponseCopyWith<_$_LoadedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
