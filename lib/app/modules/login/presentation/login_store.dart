import 'package:flutter_triple/flutter_triple.dart';
import '../../../shared/external/adapters/errors.dart';
import 'login_state.dart';

class LoginStore extends StreamStore<Failure, LoginState> {
  LoginStore() : super(LoginState());
}
