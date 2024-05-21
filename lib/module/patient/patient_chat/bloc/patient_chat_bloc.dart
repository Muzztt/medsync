import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/patient_chat_event.dart';
import '../state/patient_chat_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class PatientChatBloc extends Bloc<PatientChatEvent, PatientChatState>
    implements IBlocBase {
  // final List<ChatMessage> _messages = [];
  // final ChatUser _currentUser = ChatUser(id: "0", firstName: "User");

  PatientChatBloc() : super(PatientChatState()) {
    on<PatientChatIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });
    // on<SendMessageEvent>((event, emit) {
    //   _messages.add(event.message);
    //   emit(PatientChatState(messages: List.from(_messages)));
    // });
  }

  @override
  void initState() {
    //initState event
  }

  @override
  void dispose() {
    //dispose event
  }

  @override
  void ready() {
    //ready event
  }
}
