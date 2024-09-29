import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class PersonDetailsGoBackButtonWidget extends StatelessWidget {
  const PersonDetailsGoBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void onGoBack() {
      Navigator.of(context).pop();
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: onGoBack,
        icon: const Icon(
          EvaIcons.arrowBackOutline,
        ),
      ),
    );
  }
}
