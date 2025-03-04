// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';

import 'package:realestate/data.dart/data.dart';
import 'package:realestate/provider/book_provider.dart';
// import 'package:realestate/data.dart/data2.dart';
import 'package:realestate/provider/favorite_prvider.dart';
import 'package:realestate/screans/bookingScreen.dart';
import 'package:realestate/screans/sign_up.dart';

// ignore: must_be_immutable
class HouseDetalesScrean extends StatelessWidget {
  const HouseDetalesScrean({super.key, required this.house});
  final House house;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final provider = FavoritePrvider.of(context);
    

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBarSection(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPriceAndBookmark(provider, context),
                  const SizedBox(height: 24),
                  _buildPropertyFeatures(),
                  const SizedBox(height: 24),
                  _buildDescriptionSection(),
                  const SizedBox(height: 24),
                  _buildLoanCalculatorSection(context),
                  const SizedBox(height: 32),
                  _buildMapSection(),
                  const SizedBox(height: 32),
                  _buildContactAndBookingSection(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------- App Bar Section --------------------
  SliverAppBar _buildAppBarSection(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(24)),
              child: Image.asset(house.image, fit: BoxFit.cover),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54],
                ),
              ),
            ),
          ],
        ),
      ),
      pinned: true,
      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.share),
      //     onPressed: () {}
      //     // => _shareProperty(context
      //     // ),
      //   ),
      // ],
    );
  }

  // -------------------- Price & Bookmark --------------------
  Widget _buildPriceAndBookmark(
      FavoritePrvider provider, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          house.price,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        IconButton(
          iconSize: 36,
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              provider.isExist(house) ? Icons.bookmark : Icons.bookmark_outline,
              key: ValueKey<bool>(provider.isExist(house)),
            ),
          ),
          onPressed: () => _toggleFavorite(provider, context),
        )
      ],
    );
  }

  // -------------------- Property Features --------------------
  Widget _buildPropertyFeatures() {
    return Wrap(
      spacing: 20,
      runSpacing: 12,
      children: [
        _buildFeatureItem(Icons.bathtub_outlined, house.baths),
        _buildFeatureItem(Icons.bed_outlined, house.beds),
        _buildFeatureItem(Icons.aspect_ratio, house.size),
        _buildFeatureItem(Icons.layers_outlined, '2 Floors'),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }

  // -------------------- Description Section --------------------
  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Description'),
        const SizedBox(height: 8),
        Text(
          description1,
          style: TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  // -------------------- Loan Calculator --------------------
  Widget _buildLoanCalculatorSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Home Loan Calculator'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$1,602/month',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
              IconButton(
                  icon: Icon(Icons.info_outline, color: color), onPressed: () {}
                  // => _showLoanDetails(context),
                  ),
            ],
          ),
        ),
      ],
    );
  }

  // -------------------- Map Section --------------------
  Widget _buildMapSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Location'),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              'assets/images/map.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Center(child: Icon(Icons.error_outline)),
            ),
          ),
        )
      ],
    );
  }

  // -------------------- Contact & Booking --------------------
  Widget _buildContactAndBookingSection(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 1),
        const SizedBox(height: 24),
        Row(
          children: [
            _buildContactButton(),
            const SizedBox(width: 16),
            Expanded(child: _buildBookButton(context)),
          ],
        ),
      ],
    );
  }

  Widget _buildContactButton() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.email_outlined,
        color: color,
        size: 28,
      ),
    );
  }

Widget _buildBookButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingsScreen(house: house),
        ),
      );
    },
    child: const Text(
      'Book Now',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

  void _showBookingConfirmation(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text(
        '!Booking confirmed successfully',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.green.shade600,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
    ),
  );
}

  // -------------------- Helper Methods --------------------
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade800,
      ),
    );
  }

  void _toggleFavorite(FavoritePrvider provider, BuildContext context) {
    provider.toggleFavoite(house);
    _showFavoriteSnackbar(context, provider.isExist(house));
  }


  void _showFavoriteSnackbar(BuildContext context, bool isFavorite) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white),
            const SizedBox(width: 8),
            Text(isFavorite ? 'Added to Favorites' : 'Removed from Favorites'),
          ],
        ),
        backgroundColor: Colors.black87,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  // ... باقي الدوال المساعدة
}
