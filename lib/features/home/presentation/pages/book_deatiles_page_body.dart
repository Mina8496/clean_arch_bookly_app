import 'package:clean_arch_bookly_app/core/utils/styles.dart';
import 'package:clean_arch_bookly_app/core/widgets/custom_app_bar.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDeatilesPageBody extends StatelessWidget {
  const BookDeatilesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .25),
          child: CustomBookItem(),
        ),
        SizedBox(height: 43),
        Text(
          'The Junger Book',
          style: Styles.textStyle30.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Rudyard Kipling',
          style: Styles.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
