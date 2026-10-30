import 'package:clean_arch_bookly_app/core/utils/styles.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/similer_books_listview.dart';
import 'package:flutter/material.dart';

class SimilarBooksSeaction extends StatelessWidget {
  const SimilarBooksSeaction({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'You Can also like',
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: 16),
        SimilerBooksListView(book: book,),
      ],
    );
  }
}
