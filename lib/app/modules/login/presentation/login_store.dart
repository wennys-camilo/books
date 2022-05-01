import 'package:books/app/shared/domain/helpers/errors/failure.dart';
import 'package:books/app/shared/domain/usecases/set_token_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginStore extends StreamStore<Failure, LoginState> {
  final LoginUsecase _loginUsecase;
  final SetTokenUsecase _setTokenUsecase;

  LoginStore(this._loginUsecase, this._setTokenUsecase)
      : super(LoginState(email: '', password: ''));

  Future<void> login() async {
    final response = await _loginUsecase(state.email, state.password);
    response.fold(setError, (result) async {
      await _setTokenUsecase(result.tokenEntity.token);
      Modular.to.navigate('/home');
    });
  }

  onChangeEmail(String value) {
    update(state.copyWith(email: value));
  }

  onChangePassword(String value) {
    update(state.copyWith(password: value));
  }
}
