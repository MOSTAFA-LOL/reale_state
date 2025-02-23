import 'package:flutter/material.dart';

import 'package:realestate/data.dart/data.dart';
import 'package:realestate/screans/housedetalesscrean.dart';
import 'package:realestate/screans/sign_up.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
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
    return Scaffold(
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
                    'Good Morning',
                    style: TextStyle(
                        fontSize: 10,
                        // ignore: deprecated_member_use
                        color: color),
                  ),
                  Text(
                    'Andrian hajdin',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
            Spacer(), //محاذاه الي اليمين
            Stack(
              children: [
                Icon(Icons.notifications_none),
                Container(
                  padding: EdgeInsets.all(1),
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  child: Text('2'),
                )
              ],
            )
          ]),
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
            //card 1
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  'Featured',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blueAccent),
                ),
              ),
            ],
          ),
          SizedBox(height: 333, child: card()),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  'Our Recommendation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blueAccent),
                ),
              ),
            ],
          ),
          SizedBox(),
          Column(
            children: [secondCard()],
          )
        ]),
      )),
    );
  }



  Widget card() {
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          crossAxisSpacing: 11,
          mainAxisExtent: 177),
      itemCount: realEstatemodelcard.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final house = realEstatemodelcard[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => HouseDetalesScrean(house:house ,
                      
                      )));
            // return Detailspage3();
          },
          child: SizedBox(
            width: 250,
            height: 400,
            child: Stack(
              children: [
                SizedBox(
                  height: 340,
                  width: 333,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16)),
                    child: Image.asset(
                      house.image,
                      fit: BoxFit.fill,
                      width: 160,
                      height: 240,
                    ),
                  ),
                ),
                Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,
                            ),
                            Text(
                              house.rate,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ))),
                Positioned(
                  bottom: 1,
                  right: 5,
                  child: FloatingActionButton(
                      heroTag: null,
                      mini: true,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ),
                Positioned(
                  top: 277,
                  right: 55,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        house.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            house.place,
                            style: TextStyle(
                                // ignore: deprecated_member_use
                                color: Colors.white.withOpacity(.8)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget secondCard() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15,
          mainAxisExtent: 177),
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
          child: SizedBox(
            child: Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: Container(
                          width: 157,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 212, 212, 212),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(),
                              Image.asset(house.image),
                              Text(
                                house.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                house.place,
                                style: TextStyle(fontWeight: FontWeight.w200),
                              ),
                              Text(
                                house.price,
                                style: TextStyle(color: color),
                              ),
                            ],
                          )),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  house.rate,
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ))),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );

  }
}
