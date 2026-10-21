import 'package:clean_arch_bookly_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SizedBox(height: 15),
        Text('Read Free books', textAlign: TextAlign.center),
      ],
    );
  }
}
