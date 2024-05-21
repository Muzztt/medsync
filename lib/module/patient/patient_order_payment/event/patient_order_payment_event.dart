abstract class PatientOrderPaymentEvent {}

class PatientOrderPaymentIncrementEvent extends PatientOrderPaymentEvent {}

class PatientOrderPaymentCheckoutEvent extends PatientOrderPaymentEvent {}

class PatientOrderPaymentGetDataEvent extends PatientOrderPaymentEvent {}
