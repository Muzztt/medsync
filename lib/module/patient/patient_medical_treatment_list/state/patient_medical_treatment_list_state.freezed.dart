// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_medical_treatment_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientMedicalTreatmentListState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientMedicalTreatmentListStateCopyWith<PatientMedicalTreatmentListState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientMedicalTreatmentListStateCopyWith<$Res> {
  factory $PatientMedicalTreatmentListStateCopyWith(
          PatientMedicalTreatmentListState value,
          $Res Function(PatientMedicalTreatmentListState) then) =
      _$PatientMedicalTreatmentListStateCopyWithImpl<$Res,
          PatientMedicalTreatmentListState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$PatientMedicalTreatmentListStateCopyWithImpl<$Res,
        $Val extends PatientMedicalTreatmentListState>
    implements $PatientMedicalTreatmentListStateCopyWith<$Res> {
  _$PatientMedicalTreatmentListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientMedicalTreatmentListStateImplCopyWith<$Res>
    implements $PatientMedicalTreatmentListStateCopyWith<$Res> {
  factory _$$PatientMedicalTreatmentListStateImplCopyWith(
          _$PatientMedicalTreatmentListStateImpl value,
          $Res Function(_$PatientMedicalTreatmentListStateImpl) then) =
      __$$PatientMedicalTreatmentListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$PatientMedicalTreatmentListStateImplCopyWithImpl<$Res>
    extends _$PatientMedicalTreatmentListStateCopyWithImpl<$Res,
        _$PatientMedicalTreatmentListStateImpl>
    implements _$$PatientMedicalTreatmentListStateImplCopyWith<$Res> {
  __$$PatientMedicalTreatmentListStateImplCopyWithImpl(
      _$PatientMedicalTreatmentListStateImpl _value,
      $Res Function(_$PatientMedicalTreatmentListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$PatientMedicalTreatmentListStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PatientMedicalTreatmentListStateImpl
    implements _PatientMedicalTreatmentListState {
  _$PatientMedicalTreatmentListStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'PatientMedicalTreatmentListState(counter: $counter)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientMedicalTreatmentListStateImplCopyWith<
          _$PatientMedicalTreatmentListStateImpl>
      get copyWith => __$$PatientMedicalTreatmentListStateImplCopyWithImpl<
          _$PatientMedicalTreatmentListStateImpl>(this, _$identity);
}

abstract class _PatientMedicalTreatmentListState
    implements PatientMedicalTreatmentListState {
  factory _PatientMedicalTreatmentListState({int counter}) =
      _$PatientMedicalTreatmentListStateImpl;

  @override
  int get counter;
  set counter(int value);
  @override
  @JsonKey(ignore: true)
  _$$PatientMedicalTreatmentListStateImplCopyWith<
          _$PatientMedicalTreatmentListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
