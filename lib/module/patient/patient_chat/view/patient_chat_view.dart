import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hyper_ui_test_test/module/patient/patient_chat/widget/chat_bot.dart';
import '../bloc/patient_chat_bloc.dart';
import '../event/patient_chat_event.dart';
import '../state/patient_chat_state.dart';
import 'package:get_it/get_it.dart';

class PatientChatView extends StatefulWidget {
  const PatientChatView({Key? key}) : super(key: key);

  @override
  State<PatientChatView> createState() => _PatientChatViewState();
}

class _PatientChatViewState extends State<PatientChatView> {
  PatientChatBloc bloc = PatientChatBloc();

  @override
  void initState() {
    if (GetIt.I.isRegistered<PatientChatBloc>()) {
      GetIt.I.unregister<PatientChatBloc>();
    }
    GetIt.I.registerSingleton(bloc);
    bloc.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => bloc.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => bloc,
      child: BlocListener<PatientChatBloc, PatientChatState>(
        listener: (context, state) {},
        child: BlocBuilder<PatientChatBloc, PatientChatState>(
          builder: (context, state) {
            final bloc = context.read<PatientChatBloc>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    PatientChatBloc bloc,
    PatientChatState state,
  ) {
    return ChatBot();
  }
}
