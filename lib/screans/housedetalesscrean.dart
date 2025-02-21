// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:realestate/data.dart/data.dart';
// import 'package:realestate/data.dart/data2.dart';
import 'package:realestate/provider/favorite_prvider.dart';
import 'package:realestate/screans/sign_up.dart';

class HouseDetalesScrean extends StatefulWidget {
  const HouseDetalesScrean({
    super.key,
    required this.house,
  });

  final House house;

  @override
  State<HouseDetalesScrean> createState() => _HouseDetalesScrean();
}

class _HouseDetalesScrean extends State<HouseDetalesScrean> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    // final Provider = FavoritePrvider.of(context);
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  child: SizedBox(
                    width: size.width,
                    height: 333,
                    child: Image.asset(
                      widget.house.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Material(
                  //to design a card
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 30, top: 15, right: 10, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.house.price,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                              },
                              child: Icon(
                                isLiked == false?
                                    Icons.bookmark_outline
                                    : Icons.bookmark,
                                color: Colors.blueAccent,
                              ),
                            )
                          ],
                        ),
                        Text(widget.house.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.spa,
                                  size: 15,
                                ),
                                Text(widget.house.baths),
                                Icon(
                                  Icons.room_service,
                                  size: 15,
                                ),
                                Text(widget.house.beds),
                                Icon(
                                  Icons.home,
                                  size: 15,
                                ),
                                Text('2')
                              ],
                            ),
                            Text(widget.house.size)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        Text(
                          'Home Loan Calulator',
                          style: TextStyle(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$1,602/month'),
                            Icon(
                              Icons.question_answer,
                              color: Colors.blue,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'You home Loan',
                          style: TextStyle(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('Apply for Conditional approval'),
                        Image.asset('assets/images/map.png'),
                        Row(
                          children: [
                            Container(
                                width: 40,
                                height: 35,
                                // padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: FractionalOffset.bottomCenter,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                      Colors.white,
                                      // ignore: deprecated_member_use
                                      Colors.white.withOpacity(0.7),
                                      // ignore: deprecated_member_use
                                      Colors.white.withOpacity(0.0),
                                    ])),
                              ),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
