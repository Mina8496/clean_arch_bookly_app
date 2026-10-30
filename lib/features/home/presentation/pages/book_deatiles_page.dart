import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/book_deatiles_page_body.dart';
import 'package:flutter/material.dart';

class BookDeatilesPage extends StatelessWidget {
  const BookDeatilesPage({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDeatilesPageBody(book: book));
  }
}
