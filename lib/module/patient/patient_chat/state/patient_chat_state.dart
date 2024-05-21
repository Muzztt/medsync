import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'patient_chat_state.freezed.dart';

@unfreezed
class PatientChatState with _$PatientChatState {
  factory PatientChatState({
    @Default(0) int counter,
    // @Default([]) List<ChatMessage> messages,
  }) = _PatientChatState;
}
