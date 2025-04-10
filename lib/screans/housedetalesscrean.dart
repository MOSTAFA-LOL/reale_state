// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';

import 'package:realestate/data/data.dart';
import 'package:realestate/provider/book_provider.dart';
// import 'package:realestate/data.dart/data2.dart';
import 'package:realestate/provider/favorite_prvider.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppBarSection (context),
              const SizedBox(height: 24),
              _buildPriceAndBookmark(provider, context),
              const SizedBox(height: 20),
              _buildHeaderSection(),
              const SizedBox(height: 24),
              _buildAmenitiesSection(),
              const Divider(height: 40),
              _buildAgentSection(),
              const Divider(height: 40),
              _buildOverviewSection(),
              const Divider(height: 40),
              _buildFacilitiesSection(),
              const Divider(height: 40),
              _buildGallerySection(),
              SizedBox(height: 10,),
              _buildMapSection(context),
              
              _buildContactAndBookingSection(context)
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'شقق',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              '4.8',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade800,
              ),
            ),
            const SizedBox(width: 8),
            ...List.generate(
                5,
                (index) => Icon(
                      Icons.star,
                      color: Colors.orange.shade400,
                      size: 18,
                    )),
            const SizedBox(width: 8),
            Text(
              '(1,275 اراء العملاء)',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAmenitiesSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAmenityItem(Icons.bed, '8 سرير'),
        _buildAmenityItem(Icons.bathtub, '3 حمام'),
        _buildAmenityItem(Icons.aspect_ratio, '2000 متر/مربع'),
      ],
    );
  }

  Widget _buildAmenityItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.blue.shade800),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildAgentSection() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Image.asset(
            fit:BoxFit.fill ,
            height: 55,
            'assets/images/e5ab50f405a225bd949fc3b9c960de8d.png'
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'عميل',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            const Text(
              'Natasya Wilodra',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' المالك',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الاراء',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Sleek, modern 2-bedroom apartment with open businesses '
          'that read artists and educators.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
            height: 1.4,
          ),
        ),
      ],
    );
  }
    Widget _buildFacilitiesSection() {
    final facilities = [
      'جراج سيارات ',
      'حمامات سباحه', 
      'صالات رياضيه', 
      'مطاعم',
      'شبكه اتصالات ', 
      'مركز للحيوانات الاليفه', 
      'مراكز رياضيه ', 
      'مغسله '
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المميزات',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 3,
          children: facilities.map((facility) => Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade600, size: 20),
              const SizedBox(width: 8),
              Text(facility, style: TextStyle(color: Colors.grey.shade600)),]
            ),
          ).toList(),
        ),
      ],
    );
  }
  Widget _buildGallerySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الموقع',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        const SizedBox(height: 12),
        _buildLocationItem('مصر الجديده 100 شارع شبرا '),
        _buildLocationItem('77 منطقه الكوربه '),
        _buildLocationItem('10 شارع وسط البلد'),
        _buildLocationItem('مديني'),
        _buildLocationItem('مدينه الرحاب '),
      ],
    );
  }

  Widget _buildLocationItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.red.shade600, size: 18),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }


  // -------------------- App Bar Section --------------------
  Widget _buildAppBarSection(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: 'property-${house.id}',
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(33)),
              child: Image.asset(
                house.image,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.home_outlined),
                ),
              ),
            ),
          ),
        ),

        // const DecoratedBox(
        //   decoration: BoxDecoration(
        //     borderRadius:
        //         BorderRadius.vertical(bottom: Radius.circular(24)),
        //     gradient: LinearGradient(
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //       colors: [Colors.transparent, Colors.black54],
        //     ),
        //   ),
        // ),
      ],
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
              color: color,
              key: ValueKey<bool>(provider.isExist(house)),
            ),
          ),
          onPressed: () => _toggleFavorite(provider, context),
        )
      ],
    );
  }

  // -------------------- Property Features --------------------



  // -------------------- Description Section --------------------


  // -------------------- Loan Calculator --------------------
  

  // -------------------- Map Section --------------------
  Widget _buildMapSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        // ignore: deprecated_member_use
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
    final bookProvider = context.read<BookProvider>();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      onPressed: () {
        bookProvider.bookHouse(house);
        Navigator.pop(context);
        _showBookingConfirmation(context);
      },
      child: Text(
        'احجز الان',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // -------------------- Helper Methods --------------------

  void _showBookingConfirmation(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'تم الحجز بنجاح',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
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
                color: const Color.fromARGB(255, 243, 18, 18)),
            const SizedBox(width: 8),
            Text(
              isFavorite ? 'اضف الي المفضله' : 'تم الحذف من المفضله',
              style: TextStyle(color: color),
            ),
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
