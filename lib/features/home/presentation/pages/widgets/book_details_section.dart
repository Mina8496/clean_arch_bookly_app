import 'package:clean_arch_bookly_app/core/utils/styles.dart';
import 'package:clean_arch_bookly_app/core/widgets/custom_app_bar.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/book_action.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/book_rating.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/custom_book_iamge.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookEntity book;

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
          child: CustomBookImage(image: book.image ?? ''),
        ),
        SizedBox(height: 43),
        Text(
          textAlign: TextAlign.center,
          book.title,
          maxLines: 2,
          style: Styles.textStyle20.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        Text(
          book.authorName ?? 'No Name',
          style: Styles.textStyle18.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 18),
        BookRating(mainAxisAlignment: MainAxisAlignment.center),
        SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: BookAction(),
        ),
      ],
    );
  }
}
