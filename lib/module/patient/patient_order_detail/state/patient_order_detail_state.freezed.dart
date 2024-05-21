// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_order_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientOrderDetailState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;
  String get doctorName => throw _privateConstructorUsedError;
  set doctorName(String value) => throw _privateConstructorUsedError;
  String get spesialization => throw _privateConstructorUsedError;
  set spesialization(String value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientOrderDetailStateCopyWith<PatientOrderDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientOrderDetailStateCopyWith<$Res> {
  factory $PatientOrderDetailStateCopyWith(PatientOrderDetailState value,
          $Res Function(PatientOrderDetailState) then) =
      _$PatientOrderDetailStateCopyWithImpl<$Res, PatientOrderDetailState>;
  @useResult
  $Res call({int counter, String doctorName, String spesialization});
}

/// @nodoc
class _$PatientOrderDetailStateCopyWithImpl<$Res,
        $Val extends PatientOrderDetailState>
    implements $PatientOrderDetailStateCopyWith<$Res> {
  _$PatientOrderDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? doctorName = null,
    Object? spesialization = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      doctorName: null == doctorName
          ? _value.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String,
      spesialization: null == spesialization
          ? _value.spesialization
          : spesialization // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientOrderDetailStateImplCopyWith<$Res>
    implements $PatientOrderDetailStateCopyWith<$Res> {
  factory _$$PatientOrderDetailStateImplCopyWith(
          _$PatientOrderDetailStateImpl value,
          $Res Function(_$PatientOrderDetailStateImpl) then) =
      __$$PatientOrderDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter, String doctorName, String spesialization});
}

/// @nodoc
class __$$PatientOrderDetailStateImplCopyWithImpl<$Res>
    extends _$PatientOrderDetailStateCopyWithImpl<$Res,
        _$PatientOrderDetailStateImpl>
    implements _$$PatientOrderDetailStateImplCopyWith<$Res> {
  __$$PatientOrderDetailStateImplCopyWithImpl(
      _$PatientOrderDetailStateImpl _value,
      $Res Function(_$PatientOrderDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? doctorName = null,
    Object? spesialization = null,
  }) {
    return _then(_$PatientOrderDetailStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      doctorName: null == doctorName
          ? _value.doctorName
          : doctorName // ignore: cast_nullable_to_non_nullable
              as String,
      spesialization: null == spesialization
          ? _value.spesialization
          : spesialization // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PatientOrderDetailStateImpl implements _PatientOrderDetailState {
  _$PatientOrderDetailStateImpl(
      {this.counter = 0,
      this.doctorName = "Dr. Gunawan",
      this.spesialization = "Spesialis Anak"});

  @override
  @JsonKey()
  int counter;
  @override
  @JsonKey()
  String doctorName;
  @override
  @JsonKey()
  String spesialization;

  @override
  String toString() {
    return 'PatientOrderDetailState(counter: $counter, doctorName: $doctorName, spesialization: $spesialization)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientOrderDetailStateImplCopyWith<_$PatientOrderDetailStateImpl>
      get copyWith => __$$PatientOrderDetailStateImplCopyWithImpl<
          _$PatientOrderDetailStateImpl>(this, _$identity);
}

abstract class _PatientOrderDetailState implements PatientOrderDetailState {
  factory _PatientOrderDetailState(
      {int counter,
      String doctorName,
      String spesialization}) = _$PatientOrderDetailStateImpl;

  @override
  int get counter;
  set counter(int value);
  @override
  String get doctorName;
  set doctorName(String value);
  @override
  String get spesialization;
  set spesialization(String value);
  @override
  @JsonKey(ignore: true)
  _$$PatientOrderDetailStateImplCopyWith<_$PatientOrderDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
