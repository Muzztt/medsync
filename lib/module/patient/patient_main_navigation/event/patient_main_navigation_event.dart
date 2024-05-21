abstract class PatientMainNavigationEvent {}

class PatientMainNavigationIncrementEvent extends PatientMainNavigationEvent {}

class PatientMainNavigationUpdateIndexEvent extends PatientMainNavigationEvent {
  final int selctedIndex;
  PatientMainNavigationUpdateIndexEvent({
    required this.selctedIndex,
  });
}
