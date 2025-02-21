import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 22,vertical: 22),
        child: Column(
          children: [
            Row(
              children: [
                Text('Profile',style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.bold),),
                Spacer(),
                  Stack(
              children: [
                Icon(Icons.notifications_none),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration:
                      BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                  child: Text('2'),
                )]),
                
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
                  decoration:
                      BoxDecoration(color: const Color.fromARGB(255, 51, 70, 240),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Icon(Icons.edit_sharp,size: 20,),
            ),
            
              ],
            ),
            SizedBox(height: 5,),
            Text('Adrian Hajdin',
            style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 22
            ),),
            SizedBox(height: 12,),
            Divider(),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.7),
                    ),
                    SizedBox(width: 7,),
                    Text('My Booking',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 180,),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                  SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.payment,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.7),),
                    SizedBox(width: 7,),
                    Text('Payments',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    )
                    ,SizedBox(width: 192,),
                    Icon(Icons.keyboard_arrow_right,
                    
                    ),
                  ],
                ),
                
              ],
            ),
            SizedBox(height: 12,),
            Divider(),
            SizedBox(height: 5,),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.person_outline,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.7),),
                    SizedBox(width: 7,),
                    Text('Profile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 213,),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                  SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.notifications_none,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.7),),
                    SizedBox(width: 7,),
                    Text('Notifications',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    )
                    ,SizedBox(width: 173,),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                  SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.security_sharp,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.7),),
                    SizedBox(width: 7,),
                    Text('Security',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    )
                    ,SizedBox(width: 203,),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.language,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.7),),
                    SizedBox(width: 7,),
                    Text('Language',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    )
                    ,SizedBox(width: 193,),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                  SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.help_center,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.7),),
                    SizedBox(width: 7,),
                    Text('Help Center',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    )
                    ,SizedBox(width: 182,),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
                  SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.people_outline,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.7),),
                    SizedBox(width: 7,),
                    Text('Invite friends',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    )
                    ,SizedBox(width: 173,),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ), 
                  SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.logout,
                    // ignore: deprecated_member_use
                    color: Colors.redAccent.withOpacity(.7),),
                    SizedBox(width: 7,),
                    Text('Logout',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold),
                    )
                    
                  ],
                ),
                
              ],
            )
          ],
        ),
        ),
      )
    );
  }
}
 //محاذاه الي اليمين
          