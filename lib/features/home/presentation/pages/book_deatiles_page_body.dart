import 'package:clean_arch_bookly_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookDeatilesPageBody extends StatelessWidget {
  const BookDeatilesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: CustomAppBar(
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_outlined),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
