import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/screans/homepage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

Color color = Colors.blueAccent;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Log in",
                      style: TextStyle(
                        color: color,
                        fontSize: 33,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/R.png",
                      width: 170,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please Enter Your Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 165, 167, 172),
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 266,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: const Color.fromARGB(
                                  255, 0, 0, 0),
                            ),
                            hintText: "Your Email :",
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 165, 167, 172),
                        borderRadius: BorderRadius.circular(66),
                      ),
                      width: 266,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            suffix: Icon(
                              Icons.visibility,
                              color: const Color.fromARGB(
                                  255, 0, 0, 0),
                            ),
                            icon: Icon(
                              Icons.lock,
                              color: const Color.fromARGB(
                                  255, 0, 0, 0),
                              size: 19,
                            ),
                            hintText: "Password :",
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context, 
                            MaterialPageRoute(
                                builder: (_) => Homepage()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(color),
                        padding: WidgetStateProperty.all(
                            EdgeInsets.symmetric(
                                horizontal: 106, vertical: 10)),
                        shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "login",
                        style: TextStyle(
                            color: Colors.white, fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: .6,
                            color: color,
                          )),
                          Text('OR'),
                          Expanded(
                              child: Divider(
                            thickness: .6,
                            color: Colors.lightBlue,
                          )),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 76, 74, 77),
                                      width: 1)),
                              child: SvgPicture.asset(
                                "assets/icons/facebook.svg",
                                // ignore: deprecated_member_use
                                color: Colors.blueAccent,
                                height: 27,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 76, 74, 77),
                                      width: 1)),
                              child: SvgPicture.asset(
                                "assets/icons/google-plus.svg",
                                // ignore: deprecated_member_use
                                color: Colors.blueAccent,
                                height: 27,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 76, 74, 77),
                                      width: 1)),
                              child: SvgPicture.asset(
                                "assets/icons/twitter.svg",
                                // ignore: deprecated_member_use
                                color: color,
                                height: 27,
                              ),
                            ),
                          ),
                        ])
                  ],
                ),
              )
            ]),
          )));
  }
}
