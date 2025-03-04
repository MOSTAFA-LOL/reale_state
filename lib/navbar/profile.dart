// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:realestate/Theme/theme.dart';
import 'package:realestate/data.dart/data.dart';
import 'package:realestate/navbar/saved.dart';
import 'package:realestate/provider/book_provider.dart';
import 'package:realestate/screans/bookingScreen.dart';
import 'package:realestate/screans/bookpage.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
    
  });
  

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final moonIcon = CupertinoIcons.moon_stars;
    // final sunIcon = CupertinoIcons.sun_max;
    final provider = BookProvider.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      ThemeService().changeTheme();
                    },
                    icon: Icon(moonIcon)),
              ],
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: EdgeInsets.all(1),
                  child: Image.asset(
                    'assets/images/avatar.png',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 51, 70, 240),
                      borderRadius: BorderRadius.circular(4)),
                  child: Icon(
                    Icons.edit_sharp,
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Adrian Hajdin',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 12,
            ),
            Divider(),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bookpage(),
                        ));
                  },
                  child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(.7),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'My Booking',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 180,
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                ),
              
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Saved(),
                        ));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.payment,
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(.7),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Saved',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 218,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Divider(),
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(.7),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Terms Of Service',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 144,
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(.7),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 166,
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(.7),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Language',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 193,
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.logout,
                      // ignore: deprecated_member_use
                      color: Colors.redAccent.withOpacity(.7),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }






}
 //محاذاه الي اليمين
          