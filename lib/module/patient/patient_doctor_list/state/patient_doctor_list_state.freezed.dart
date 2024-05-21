// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_doctor_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientDoctorListState {
  int get counter => throw _privateConstructorUsedError;
  set counter(int value) => throw _privateConstructorUsedError;
  List<dynamic> get categories => throw _privateConstructorUsedError;
  set categories(List<dynamic> value) => throw _privateConstructorUsedError;
  List<dynamic> get doctorList => throw _privateConstructorUsedError;
  set doctorList(List<dynamic> value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientDoctorListStateCopyWith<PatientDoctorListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientDoctorListStateCopyWith<$Res> {
  factory $PatientDoctorListStateCopyWith(PatientDoctorListState value,
          $Res Function(PatientDoctorListState) then) =
      _$PatientDoctorListStateCopyWithImpl<$Res, PatientDoctorListState>;
  @useResult
  $Res call({int counter, List<dynamic> categories, List<dynamic> doctorList});
}

/// @nodoc
class _$PatientDoctorListStateCopyWithImpl<$Res,
        $Val extends PatientDoctorListState>
    implements $PatientDoctorListStateCopyWith<$Res> {
  _$PatientDoctorListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? categories = null,
    Object? doctorList = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      doctorList: null == doctorList
          ? _value.doctorList
          : doctorList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientDoctorListStateImplCopyWith<$Res>
    implements $PatientDoctorListStateCopyWith<$Res> {
  factory _$$PatientDoctorListStateImplCopyWith(
          _$PatientDoctorListStateImpl value,
          $Res Function(_$PatientDoctorListStateImpl) then) =
      __$$PatientDoctorListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int counter, List<dynamic> categories, List<dynamic> doctorList});
}

/// @nodoc
class __$$PatientDoctorListStateImplCopyWithImpl<$Res>
    extends _$PatientDoctorListStateCopyWithImpl<$Res,
        _$PatientDoctorListStateImpl>
    implements _$$PatientDoctorListStateImplCopyWith<$Res> {
  __$$PatientDoctorListStateImplCopyWithImpl(
      _$PatientDoctorListStateImpl _value,
      $Res Function(_$PatientDoctorListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? categories = null,
    Object? doctorList = null,
  }) {
    return _then(_$PatientDoctorListStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      doctorList: null == doctorList
          ? _value.doctorList
          : doctorList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$PatientDoctorListStateImpl implements _PatientDoctorListState {
  _$PatientDoctorListStateImpl(
      {this.counter = 0,
      this.categories = const [
        "General Practitioner",
        "Pediatrician",
        "Dermatologist",
        "Cardiologist",
        "Neurologist",
        "Gynecologist",
        "Oncologist",
        "Orthopedic Surgeon",
        "Psychiatrist",
        "Ophthalmologist",
        "ENT Specialist",
        "Endocrinologist",
        "Urologist",
        "Gastroenterologist",
        "Rheumatologist",
        "Pulmonologist",
        "Allergist",
        "Nephrologist",
        "Hematologist",
        "Infectious Disease Specialist",
        "Plastic Surgeon",
        "Radiologist",
        "Anesthesiologist",
        "Emergency Medicine Physician",
        "Physical Therapist",
        "Occupational Therapist",
        "Speech Therapist",
        "Dietitian",
        "Pain Management Specialist",
        "Sleep Medicine Specialist",
        "Sports Medicine Physician",
        "Geriatrician",
        "Obstetrician",
        "Neonatologist",
        "Hepatologist",
        "Intensivist",
        "Pathologist",
        "Palliative Care Physician",
        "Hospitalist",
        "Medical Geneticist",
        "Forensic Pathologist",
        "Reproductive Endocrinologist",
        "Clinical Immunologist",
        "Medical Microbiologist",
        "Clinical Pharmacologist",
        "Neurosurgeon",
        "Vascular Surgeon",
        "Thoracic Surgeon",
        "Colon and Rectal Surgeon",
        "Bariatric Surgeon",
        "Transplant Surgeon"
      ],
      this.doctorList = const [
        {
          "photo":
              "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D",
          "doctor_name": "Dr. Maria Garcia",
          "specialization": "Dermatologist",
          "address": "789 Oak Street",
          "location_in_km": 10,
          "patient_count": 30,
          "next_schedule": "2024-04-27 09:15 AM"
        },
        {
          "photo":
              "https://images.unsplash.com/photo-1582750433449-648ed127bb54?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fG1lZGljYWwlMjBjYXJlfGVufDB8fDB8fHww",
          "doctor_name": "Dr. David Brown",
          "specialization": "Cardiologist",
          "address": "101 Pine Street",
          "location_in_km": 15,
          "patient_count": 25,
          "next_schedule": "2024-04-28 02:00 PM"
        },
        {
          "photo":
              "https://images.unsplash.com/photo-1618498082410-b4aa22193b38?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzF8fG1lZGljYWwlMjBjYXJlfGVufDB8fDB8fHww",
          "doctor_name": "Dr. Sarah Lee",
          "specialization": "Neurologist",
          "address": "222 Cedar Street",
          "location_in_km": 12,
          "patient_count": 35,
          "next_schedule": "2024-04-29 03:45 PM"
        },
        {
          "photo":
              "https://plus.unsplash.com/premium_photo-1673351534357-fcce6fc86cba?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDl8fGRvY3RvciUyMG9mZmljZXxlbnwwfHwwfHx8MA%3D%3D",
          "doctor_name": "Dr. Michael Wilson",
          "specialization": "Orthopedic Surgeon",
          "address": "333 Maple Street",
          "location_in_km": 20,
          "patient_count": 20,
          "next_schedule": "2024-04-30 10:30 AM"
        }
      ]});

  @override
  @JsonKey()
  int counter;
  @override
  @JsonKey()
  List<dynamic> categories;
  @override
  @JsonKey()
  List<dynamic> doctorList;

  @override
  String toString() {
    return 'PatientDoctorListState(counter: $counter, categories: $categories, doctorList: $doctorList)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientDoctorListStateImplCopyWith<_$PatientDoctorListStateImpl>
      get copyWith => __$$PatientDoctorListStateImplCopyWithImpl<
          _$PatientDoctorListStateImpl>(this, _$identity);
}

abstract class _PatientDoctorListState implements PatientDoctorListState {
  factory _PatientDoctorListState(
      {int counter,
      List<dynamic> categories,
      List<dynamic> doctorList}) = _$PatientDoctorListStateImpl;

  @override
  int get counter;
  set counter(int value);
  @override
  List<dynamic> get categories;
  set categories(List<dynamic> value);
  @override
  List<dynamic> get doctorList;
  set doctorList(List<dynamic> value);
  @override
  @JsonKey(ignore: true)
  _$$PatientDoctorListStateImplCopyWith<_$PatientDoctorListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
