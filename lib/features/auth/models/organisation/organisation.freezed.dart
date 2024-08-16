// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../organisation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Organisation _$OrganisationFromJson(Map<String, dynamic> json) {
  return _Organisation.fromJson(json);
}

/// @nodoc
mixin _$Organisation {
  String get organisationId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_owner')
  bool get isOwner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganisationCopyWith<Organisation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganisationCopyWith<$Res> {
  factory $OrganisationCopyWith(
          Organisation value, $Res Function(Organisation) then) =
      _$OrganisationCopyWithImpl<$Res, Organisation>;
  @useResult
  $Res call(
      {String organisationId,
      String name,
      String role,
      @JsonKey(name: 'is_owner') bool isOwner});
}

/// @nodoc
class _$OrganisationCopyWithImpl<$Res, $Val extends Organisation>
    implements $OrganisationCopyWith<$Res> {
  _$OrganisationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organisationId = null,
    Object? name = null,
    Object? role = null,
    Object? isOwner = null,
  }) {
    return _then(_value.copyWith(
      organisationId: null == organisationId
          ? _value.organisationId
          : organisationId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganisationImplCopyWith<$Res>
    implements $OrganisationCopyWith<$Res> {
  factory _$$OrganisationImplCopyWith(
          _$OrganisationImpl value, $Res Function(_$OrganisationImpl) then) =
      __$$OrganisationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String organisationId,
      String name,
      String role,
      @JsonKey(name: 'is_owner') bool isOwner});
}

/// @nodoc
class __$$OrganisationImplCopyWithImpl<$Res>
    extends _$OrganisationCopyWithImpl<$Res, _$OrganisationImpl>
    implements _$$OrganisationImplCopyWith<$Res> {
  __$$OrganisationImplCopyWithImpl(
      _$OrganisationImpl _value, $Res Function(_$OrganisationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organisationId = null,
    Object? name = null,
    Object? role = null,
    Object? isOwner = null,
  }) {
    return _then(_$OrganisationImpl(
      organisationId: null == organisationId
          ? _value.organisationId
          : organisationId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganisationImpl implements _Organisation {
  const _$OrganisationImpl(
      {required this.organisationId,
      required this.name,
      required this.role,
      @JsonKey(name: 'is_owner') required this.isOwner});

  factory _$OrganisationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganisationImplFromJson(json);

  @override
  final String organisationId;
  @override
  final String name;
  @override
  final String role;
  @override
  @JsonKey(name: 'is_owner')
  final bool isOwner;

  @override
  String toString() {
    return 'Organisation(organisationId: $organisationId, name: $name, role: $role, isOwner: $isOwner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganisationImpl &&
            (identical(other.organisationId, organisationId) ||
                other.organisationId == organisationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, organisationId, name, role, isOwner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganisationImplCopyWith<_$OrganisationImpl> get copyWith =>
      __$$OrganisationImplCopyWithImpl<_$OrganisationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganisationImplToJson(
      this,
    );
  }
}

abstract class _Organisation implements Organisation {
  const factory _Organisation(
          {required final String organisationId,
          required final String name,
          required final String role,
          @JsonKey(name: 'is_owner') required final bool isOwner}) =
      _$OrganisationImpl;

  factory _Organisation.fromJson(Map<String, dynamic> json) =
      _$OrganisationImpl.fromJson;

  @override
  String get organisationId;
  @override
  String get name;
  @override
  String get role;
  @override
  @JsonKey(name: 'is_owner')
  bool get isOwner;
  @override
  @JsonKey(ignore: true)
  _$$OrganisationImplCopyWith<_$OrganisationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
