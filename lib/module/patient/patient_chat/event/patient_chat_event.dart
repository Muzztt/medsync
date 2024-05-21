// import 'package:dash_chat_2/dash_chat_2.dart';
// import 'package:equatable/equatable.dart';

// abstract class PatientChatEvent extends Equatable {
//   const PatientChatEvent();

//   @override
//   List<Object> get props => [];
// }
abstract class PatientChatEvent {}

class PatientChatIncrementEvent extends PatientChatEvent {}

// class SendMessageEvent extends PatientChatEvent {
//   final ChatMessage message;

//   const SendMessageEvent(this.message);

//   @override
//   List<Object> get props => [message];
// }
