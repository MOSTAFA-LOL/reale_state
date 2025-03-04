import 'package:flutter/material.dart';
import 'package:realestate/data.dart/data.dart';

import 'package:realestate/screans/housedetalesscrean.dart';
import 'package:realestate/screans/sign_up.dart';

class Search extends StatelessWidget {
  final String propertyKey;
  final String propertyValue;
  final String propertyImage;
  
  const Search({
    super.key, required this.propertyKey, required this.propertyValue, required this.propertyImage, 
    
  });

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
    centerTitle: true,
    title: const Text(
      'Search Properties',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
  ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),)
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).hintColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.tune,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {},
                ),
                hintText: 'Search properties...',
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 15,
                ),
              ),
            ),
          ),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                child: Text(
                  ' $propertyValue $propertyKey',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Column(
                children: [secondCard()],
              )
            ],
          ),
        ),
      ),
    );
  }





  Widget secondCard() {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      mainAxisExtent: 400,
    ),
    itemCount: realEstatemodelSearch.length,

      itemBuilder: (context, index) {
        final house = realEstatemodelSearch[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HouseDetalesScrean(house: house)));
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(right: 8, top: 12, bottom: 12),
            decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(.15),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      height: 200,
                      width: double.infinity,
                      house.image,
                      fit: BoxFit.cover,
                    )),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      house.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2,),
                    Spacer(),
                    _buildSaleBadge(context)
                  ],
                ),
                Text(
                  house.place,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 5,),
                Text(
                  house.price,
                  style: TextStyle(color: color),
                ),
                SizedBox(height: 5,),
                Spacer(),
                _buildBookButton(context)
                
              ],
            ),
          ),
        );
      },
    );
  }
    Widget _buildSaleBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(176, 228, 220, 220),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'For Sale',
        style: TextStyle(
        color: const Color.fromARGB(157, 18, 126, 4),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
    Widget _buildBookButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        onPressed: () => _showBookingConfirmation(context),
        child: const Text(
          'Book Now',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
    void _showBookingConfirmation(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Successfully Booked',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
    );
  }
}
