import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/presentation/themes/app_theme.dart';
import '../../shared/presentation/widgets/input_text_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Modular.get<AppTheme>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  theme.images.backgroundFull,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: constraints.maxWidth > 600 ? 50 : 0),
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth > 600 ? 50 : 10,
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
                              onPressed: () {},
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                    color: theme.colors.pink, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
