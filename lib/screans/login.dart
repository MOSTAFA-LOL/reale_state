import 'package:flutter/material.dart';
import 'package:realestate/screans/homepage.dart';
import 'package:realestate/screans/sign_up.dart';
import 'package:realestate/screans/tap_screan.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:40),
                child: Image.asset('assets/images/onboarding.png'),
                
              ),
                Text(
            'Welcome To RealEstate',
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          SizedBox(height: 20,)
            ],
          ),
        

          Column(
            children: [
              Center(
                child: Text(
                  'lets Get You Closer ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    // Start with the default style from the current context
                    // style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'to',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'Your Ideal home',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'login to RealEstate with gmail',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: (
                ()=> Navigator.push(
                                        context, 
                                        MaterialPageRoute(
                                            builder: (_) => TapScrean()))),
              child: Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
              SizedBox(height: 7,),
                GestureDetector(
                    onTap: (
                      () => Navigator.push(
                                        context, 
                                        MaterialPageRoute(
                                            builder: (_) => SignUp()))),
                  child: Center(
                  child: RichText(
                    text: TextSpan(
                      // Start with the default style from the current context
                      // style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Alrealy have an account?  ',
                            style: TextStyle(
                                color: Colors.black38,
                                
                                )),
                                
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              ),
                        ),
                      ],
                    ),
                  ),),
                )
              
        ],
      ),
    );
  }
}
