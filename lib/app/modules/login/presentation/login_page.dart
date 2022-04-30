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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                theme.images.background,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
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
                padding: const EdgeInsets.only(left: 10, right: 10, top: 110),
                child: InputTextWidget(
                  labelText: "Email",
                  fillColor: theme.colors.blackLight,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: InputTextWidget(
                  labelText: "Senha",
                  fillColor: theme.colors.blackLight,
                  suffixIcon: Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 4, bottom: 4),
                    child: SizedBox(
                      width: 90,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shadowColor: theme.colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(44)),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Entrar',
                          style:
                              TextStyle(color: theme.colors.pink, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
