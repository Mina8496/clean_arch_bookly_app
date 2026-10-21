import 'package:clean_arch_bookly_app/core/utils/appStyles.dart';
import 'package:clean_arch_bookly_app/core/utils/assets_data.dart';
import 'package:clean_arch_bookly_app/core/widgets/custom_app_bar.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/featured_books_listView_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomAppBar(
            showBackButton: false,
            actions: [
              Image.asset(AssetsData.logo, height: 18),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        FeaturedBooksListViewItem(),
        SizedBox(height: 50),
        // Best Seller
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Best Seller', style: Styles.titleMedium),
        ),
        // Best Seller List View
        BestSellerBooksListView(),
      ],
    );
  }
}

class BestSellerBooksListView extends StatelessWidget {
  const BestSellerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          SizedBox(
            height: 150,
            child: AspectRatio(
              aspectRatio: 2.7 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsData.testImage),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
