// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return _RegisterModel.fromJson(json);
}

/// @nodoc
mixin _$RegisterModel {
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;

  /// Serializes this RegisterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterModelCopyWith<RegisterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterModelCopyWith<$Res> {
  factory $RegisterModelCopyWith(
          RegisterModel value, $Res Function(RegisterModel) then) =
      _$RegisterModelCopyWithImpl<$Res, RegisterModel>;
  @useResult
  $Res call(
      {String email,
      String phoneNumber,
      String? fullName,
      String? address,
      DateTime? dateOfBirth});
}

/// @nodoc
class _$RegisterModelCopyWithImpl<$Res, $Val extends RegisterModel>
    implements $RegisterModelCopyWith<$Res> {
  _$RegisterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phoneNumber = null,
    Object? fullName = freezed,
    Object? address = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterModelImplCopyWith<$Res>
    implements $RegisterModelCopyWith<$Res> {
  factory _$$RegisterModelImplCopyWith(
          _$RegisterModelImpl value, $Res Function(_$RegisterModelImpl) then) =
      __$$RegisterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String phoneNumber,
      String? fullName,
      String? address,
      DateTime? dateOfBirth});
}

/// @nodoc
class __$$RegisterModelImplCopyWithImpl<$Res>
    extends _$RegisterModelCopyWithImpl<$Res, _$RegisterModelImpl>
    implements _$$RegisterModelImplCopyWith<$Res> {
  __$$RegisterModelImplCopyWithImpl(
      _$RegisterModelImpl _value, $Res Function(_$RegisterModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? phoneNumber = null,
    Object? fullName = freezed,
    Object? address = freezed,
    Object? dateOfBirth = freezed,
  }) {
    return _then(_$RegisterModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterModelImpl implements _RegisterModel {
  const _$RegisterModelImpl(
      {required this.email,
      required this.phoneNumber,
      this.fullName,
      this.address,
      this.dateOfBirth});

  factory _$RegisterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterModelImplFromJson(json);

  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String? fullName;
  @override
  final String? address;
  @override
  final DateTime? dateOfBirth;

  @override
  String toString() {
    return 'RegisterModel(email: $email, phoneNumber: $phoneNumber, fullName: $fullName, address: $address, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, email, phoneNumber, fullName, address, dateOfBirth);

  /// Create a copy of RegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterModelImplCopyWith<_$RegisterModelImpl> get copyWith =>
      __$$RegisterModelImplCopyWithImpl<_$RegisterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterModelImplToJson(
      this,
    );
  }
}

abstract class _RegisterModel implements RegisterModel {
  const factory _RegisterModel(
      {required final String email,
      required final String phoneNumber,
      final String? fullName,
      final String? address,
      final DateTime? dateOfBirth}) = _$RegisterModelImpl;

  factory _RegisterModel.fromJson(Map<String, dynamic> json) =
      _$RegisterModelImpl.fromJson;

  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String? get fullName;
  @override
  String? get address;
  @override
  DateTime? get dateOfBirth;

  /// Create a copy of RegisterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterModelImplCopyWith<_$RegisterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
