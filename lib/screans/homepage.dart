import 'package:flutter/material.dart';

import 'package:realestate/data/data.dart';


import 'package:realestate/navbar/search.dart';
import 'package:realestate/screans/housedetalesscrean.dart';
import 'package:realestate/screans/sign_up.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class PropertyType {
  final String key;
  final String value;
  final String image;

  const PropertyType({
    required this.key,
    required this.value,
    required this.image,
  });
}

class _HomepageState extends State<Homepage> {
  // int myCurrentIndex = 0;
  // void _selectedpage(int index) {
  //   setState(() {
  //     myCurrentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final List<PropertyType> propertyTypes1 = [
      PropertyType(
          key: 'House', value: 'Found 11', image: 'assets/images/OIF (1).jpg'),
    ];
    final List<PropertyType> propertyTypes2 = [
      PropertyType(
          key: 'Villa', value: 'Found 7', image: 'assets/images/OIF (1).jpg'),
    ];
    final List<PropertyType> propertyTypes3 = [
      PropertyType(
          key: 'VIP Home', value: '1', image: 'assets/images/Private House.png'),
    ];
    final List<PropertyType> propertyTypes4 = [
      PropertyType(
          key: 'apartment', value: '6', image: 'assets/images/OIF (1).jpg'),
    ];
    final List<PropertyType> propertyTypes5 = [
      PropertyType(
          key: 'Shop', value: '11', image: 'assets/images/Shop.avif'),
    ];
    final List<PropertyType> propertyTypes6 = [
      PropertyType(
          key: 'Office', value: '4', image: 'assets/images/OIF (1).jpg'),
    ];

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          // app bar
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 55,
                  height: 50,
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'صباح الخير',
                      style: TextStyle(
                          fontSize: 12,
                          // ignore: deprecated_member_use
                          color: color,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'اسم المالك',
                        style: Theme.of(context).textTheme.titleMedium, 
                        
                    ),
                  ]),
              Spacer(),
            ]),
            Text(
              'اقسام العقارات',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        _buildPropertyTypeButton(
          context: context,
          types: propertyTypes1,
          imagePath: "assets/images/Townhouse.png",
          label: "منزل",
          imageWidth: 28,
        ),
        _buildPropertyTypeButton(
          context: context,
          types: propertyTypes2,
          imagePath: "assets/images/Villa.png",
          label: "ٌفيلا",
          imageWidth: 33,
        ),
        _buildPropertyTypeButton(
          context: context,
          types: propertyTypes3,
          imagePath: "assets/images/Private House.png",
          label: "منزلك الخاص",
          imageWidth: 25,
        ),
        _buildPropertyTypeButton(
          context: context,
          types: propertyTypes4,
          imagePath: "assets/images/Apartment.png",
          label: "شقق",
          imageWidth: 30,
        ),
        _buildPropertyTypeButton(
          context: context,
          types: propertyTypes5,
          imagePath: "assets/images/Office_1.png",
          label: "مكاتب",
          imageWidth: 22,
        ),
        _buildPropertyTypeButton(
          context: context,
          types: propertyTypes6,
          imagePath: "assets/images/Shop_1.png",
          label: "محلات ",
          imageWidth: 27,
          
        ),
      ],
    ),
  ),
),
            SizedBox(
              height: 10,
            ),
            Row(
              //card 1
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    'توصيات',
                    style: Theme.of(context).textTheme.titleLarge,
                    // TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Text(
                    'عرض المزيد',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(height: 333, child: card()),
            // SizedBox(
            //   height: 20,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 7),
            //       child: Text(
            //         'Our Recommendation',
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(right: 7),
            //       child: Text(
            //         'See All',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 20,
            //             color: Colors.blueAccent),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(),
            // Column(
            //   children: [secondCard()],
            // )
          ]),
        )),
      ),
    );
  }



  Widget card() {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      mainAxisSpacing: 20,
      crossAxisSpacing: 11,
      mainAxisExtent: 340, // Match card height
    ),
    itemCount: realEstatemodelcard.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      final house = realEstatemodelcard[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => HouseDetalesScrean(house: house)),
          );
        },
        child: Container(
          
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
                )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Image Section
                Positioned.fill(
                  child: Image.asset(
                    house.image,
                    fit: BoxFit.cover,
                  ),
                ),

                // Gradient Overlay
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          // ignore: deprecated_member_use
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.5, 1],
                      ),
                    ),
                  ),
                ),

                // "For Sale" Badge
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'للبيع',
                      style: TextStyle(
                        color: const Color.fromARGB(157, 18, 126, 4),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Property Info
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        house.name,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            // ignore: deprecated_member_use
                            color: Colors.white.withOpacity(0.9),
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            house.place,
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

  Widget _buildPropertyTypeButton({
  required BuildContext context,
  required List<PropertyType> types,
  required String imagePath,
  required String label,
  required double imageWidth,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: SizedBox(
      width: 100, // Fixed width for consistent sizing
      child: ElevatedButton(
        onPressed: () => _navigateToSearch(context, types.first),
        style: Theme.of(context).elevatedButtonTheme.style,
        
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: imageWidth,
              color: Theme.of(context).primaryColorLight,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
void _navigateToSearch(BuildContext context, PropertyType property) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Search(
        propertyKey: property.key,
        propertyValue: property.value,
        propertyImage: property.image, 
      ),
    ),
  );
}
}
