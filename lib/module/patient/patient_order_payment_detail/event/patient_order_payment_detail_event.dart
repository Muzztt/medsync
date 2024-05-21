abstract class PatientOrderPaymentDetailEvent {}

class PatientOrderPaymentDetailIncrementEvent
    extends PatientOrderPaymentDetailEvent {}

class PatientOrderPaymentDeleteEvent extends PatientOrderPaymentDetailEvent {
  // final String orderId;

  // PatientOrderPaymentDeleteEvent({required this.orderId});
}

class PatientOrderPaymentUpdateEvent extends PatientOrderPaymentDetailEvent {
  // final String orderId;
  // final String patientName;
  // final String dob;
  // final String gender;
  // final String idCard;
  // final String address;

  //   PatientOrderPaymentUpdateEvent({
  //   required this.orderId,
  //   required this.patientName,
  //   required this.dob,
  //   required this.gender,
  //   required this.idCard,
  //   required this.address,
  // });
}
