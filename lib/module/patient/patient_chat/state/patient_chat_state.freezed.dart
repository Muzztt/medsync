// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientChatState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientChatStateCopyWith<PatientChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientChatStateCopyWith<$Res> {
  factory $PatientChatStateCopyWith(
          PatientChatState value, $Res Function(PatientChatState) then) =
      _$PatientChatStateCopyWithImpl<$Res, PatientChatState>;
  @useResult
  $Res call({int counter});
}

/// @nodoc
class _$PatientChatStateCopyWithImpl<$Res, $Val extends PatientChatState>
    implements $PatientChatStateCopyWith<$Res> {
  _$PatientChatStateCopyWithImpl(this._value, this._then);

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
abstract class _$$PatientChatStateImplCopyWith<$Res>
    implements $PatientChatStateCopyWith<$Res> {
  factory _$$PatientChatStateImplCopyWith(_$PatientChatStateImpl value,
          $Res Function(_$PatientChatStateImpl) then) =
      __$$PatientChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter});
}

/// @nodoc
class __$$PatientChatStateImplCopyWithImpl<$Res>
    extends _$PatientChatStateCopyWithImpl<$Res, _$PatientChatStateImpl>
    implements _$$PatientChatStateImplCopyWith<$Res> {
  __$$PatientChatStateImplCopyWithImpl(_$PatientChatStateImpl _value,
      $Res Function(_$PatientChatStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
  }) {
    return _then(_$PatientChatStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PatientChatStateImpl implements _PatientChatState {
  _$PatientChatStateImpl({this.counter = 0});

  @override
  @JsonKey()
  int counter;

  @override
  String toString() {
    return 'PatientChatState(counter: $counter)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientChatStateImplCopyWith<_$PatientChatStateImpl> get copyWith =>
      __$$PatientChatStateImplCopyWithImpl<_$PatientChatStateImpl>(
          this, _$identity);
}

abstract class _PatientChatState implements PatientChatState {
  factory _PatientChatState({int counter}) = _$PatientChatStateImpl;

  @override
  int get counter;
  set counter(int value);
  @override
  @JsonKey(ignore: true)
  _$$PatientChatStateImplCopyWith<_$PatientChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
