import 'package:books/app/modules/login/presentation/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../shared/presentation/themes/app_theme.dart';
import '../../../shared/presentation/widgets/input_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  final theme = Modular.get<AppTheme>();

  @override
  void initState() {
    super.initState();
    store.observer(
        onError: ((error) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.message)))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    constraints.maxWidth < 600
                        ? theme.images.background
                        : theme.images.backgroundFull,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: constraints.maxWidth > 600 ? 50 : 0),
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: constraints.maxWidth > 600 ? 50 : 20,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(theme.images.logo),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Books',
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: constraints.maxWidth > 600 ? 50 : 20,
                          right: constraints.maxWidth > 600 ? 150 : 20,
                          top: constraints.maxWidth > 600 ? 50 : 110,
                        ),
                        child: SizedBox(
                          child: InputTextWidget(
                            labelText: "Email",
                            fillColor: theme.colors.blackLight,
                            onChanged: store.onChangeEmail,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: constraints.maxWidth > 600 ? 50 : 20,
                          right: constraints.maxWidth > 600 ? 150 : 20,
                        ),
                        child: InputTextWidget(
                          labelText: "Senha",
                          fillColor: theme.colors.blackLight,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              top: 4,
                              bottom: 4,
                            ),
                            child: SizedBox(
                              width: 90,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  shadowColor: theme.colors.pink,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(44),
                                  ),
                                ),
                                onPressed: () async {
                                  await store.login();
                                  //Modular.to.navigate('/home');
                                  /*
                                  Usuário de Teste: desafio@ioasys.com.br
                                  Senha de Teste: 12341234
                                  */
                                },
                                child: TripleBuilder(
                                    store: store,
                                    builder: (context, triple) {
                                      return triple.isLoading
                                          ? Center(
                                              child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: CircularProgressIndicator(
                                                color: theme.colors.pink,
                                              ),
                                            ))
                                          : Text(
                                              'Entrar',
                                              style: TextStyle(
                                                  color: theme.colors.pink,
                                                  fontSize: 16),
                                            );
                                    }),
                              ),
                            ),
                          ),
                          onChanged: store.onChangePassword,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
