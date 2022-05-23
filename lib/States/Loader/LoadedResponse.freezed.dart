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
  ResponseType get type => throw _privateConstructorUsedError;
  Map<DataType, Properties> get attributes =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

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
  $Res call(
      {ResponseType type,
      Map<DataType, Properties> attributes,
      String? errorMessage});
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
    Object? type = freezed,
    Object? attributes = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResponseType,
      attributes: attributes == freezed
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<DataType, Properties>,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {ResponseType type,
      Map<DataType, Properties> attributes,
      String? errorMessage});
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
    Object? type = freezed,
    Object? attributes = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_LoadedResponse(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ResponseType,
      attributes: attributes == freezed
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<DataType, Properties>,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LoadedResponse extends _LoadedResponse with DiagnosticableTreeMixin {
  _$_LoadedResponse(
      {this.type = ResponseType.none,
      final Map<DataType, Properties> attributes = const {},
      this.errorMessage})
      : _attributes = attributes,
        super._();

  factory _$_LoadedResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LoadedResponseFromJson(json);

  @override
  @JsonKey()
  final ResponseType type;
  final Map<DataType, Properties> _attributes;
  @override
  @JsonKey()
  Map<DataType, Properties> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadedResponse(type: $type, attributes: $attributes, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoadedResponse'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('attributes', attributes))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedResponse &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(_attributes),
      const DeepCollectionEquality().hash(errorMessage));

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
      {final ResponseType type,
      final Map<DataType, Properties> attributes,
      final String? errorMessage}) = _$_LoadedResponse;
  _LoadedResponse._() : super._();

  factory _LoadedResponse.fromJson(Map<String, dynamic> json) =
      _$_LoadedResponse.fromJson;

  @override
  ResponseType get type => throw _privateConstructorUsedError;
  @override
  Map<DataType, Properties> get attributes =>
      throw _privateConstructorUsedError;
  @override
  String? get errorMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedResponseCopyWith<_$_LoadedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
