import 'package:flutter/material.dart';
import 'package:realestate/data.dart/data.dart';
import 'package:realestate/screans/housedetalesscrean.dart';
import 'package:realestate/screans/sign_up.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search For Your Ideal Home',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              Icon(Icons.notifications_none),
              Container(
                  padding: EdgeInsets.all(2),
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  child: Text('2')),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 11),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(66),
              ),
              child: TextField(
                decoration: InputDecoration(
                    suffix: Icon(
                      Icons.display_settings_outlined,
                    ),
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'search something',
                    hintStyle: TextStyle(fontSize: 15),
                    iconColor: const Color.fromARGB(255, 133, 127, 127)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('All')),
                Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                    decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.blueGrey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('House')),
                Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                    decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.blueGrey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Villa')),
                Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                    decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.blueGrey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Apartment')),
                Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                    decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: Colors.blueGrey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Other')),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              child: Text(
                'Found 182 Apartment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            Column(
              children: [secondCard()],
            )
          ],
        ),
      ),
    );
  }

  Widget secondCard() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 2,
          crossAxisSpacing: 17,
          mainAxisExtent: 377),
      shrinkWrap: true,
      itemCount: realEstatemodel.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final house = realEstatemodel[index];
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
          margin: EdgeInsets.only(right: 8,top: 12,bottom: 12),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(.15),
            borderRadius: BorderRadius.circular(16)
          ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect
                (borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    height: 200,
                    width: double.infinity,
                    house.image,fit: BoxFit.cover,)),
                  SizedBox(height: 4,),

                Row(
                  children: [
                    Text(
                      house.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.yellow,
                    ),
                    Text(
                      house.rate,
                      style: TextStyle(fontSize: 12,
                      fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                
                Text(
                  house.place,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Text(
                  house.price,
                  style: TextStyle(color: color),
                ),
                GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Center(
                                    child: Text(
                                      'Successfully Booked',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                  shape: StadiumBorder(),
                                  behavior: SnackBarBehavior.floating,
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    right: 88, left: 88, top: 13, bottom: 13),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
              ],
            ),
          ),
        );
      },
    );
  }
}
