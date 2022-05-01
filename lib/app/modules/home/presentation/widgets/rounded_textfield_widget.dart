import 'package:books/app/shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedTextfieldWidget extends StatelessWidget {
  const RoundedTextfieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        label: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            'Pesquisar',
            style: TextStyle(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
        labelStyle: const TextStyle(fontSize: 20),
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(left: 8, top: 13, bottom: 13, right: 8),
          child: SvgPicture.asset(
            Modular.get<AppTheme>().images.searchIcon,
          ),
        ),
      ),
    );
  }
}
