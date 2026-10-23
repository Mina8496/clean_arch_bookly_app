import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/book_details_section.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/similar_books_seaction.dart';
import 'package:flutter/material.dart';

class BookDeatilesPageBody extends StatelessWidget {
  const BookDeatilesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsSection(),
              Expanded(child: SizedBox(height: 50)),
              SimilarBooksSeaction(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
