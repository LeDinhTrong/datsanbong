import 'package:field_for_rent/pages/events/login_event.dart';
import 'package:field_for_rent/pages/states/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginStateInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitted) {
      yield LoginStateLoading();
      try {
        yield LoginStateSuccess();
      } catch (e) {
        print(e);
        yield LoginStateFailure();
      }
    }
  }
}
