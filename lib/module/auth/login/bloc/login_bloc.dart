import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service/auth_service/auth_service.dart';
import '../event/login_event.dart';
import '../state/login_state.dart';
import 'package:hyper_ui_test_test/bloc_util.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> implements IBlocBase {
  LoginBloc() : super(LoginState()) {
    on<LoginIncrementEvent>((event, emit) {
      state.counter++;
      emit(state.copyWith());
    });
    on<LoginByGoogleEvent>((event, emit) async {
      var isLoggedIn = await AuthService().loginByGoogle();
      if (isLoggedIn) {
        state.isLoginSuccess = true;
        emit(state.copyWith());
      }
    });
    on<LoginByGuestEvent>((event, emit) async {
      var isLoggedIn = await AuthService().loginAsGuest();
      if (isLoggedIn) {
        state.isLoginSuccess = true;
        emit(state.copyWith());
      }
    });
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
