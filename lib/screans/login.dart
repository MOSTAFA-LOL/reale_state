import 'package:flutter/material.dart';
import 'package:realestate/generated/l10n.dart';
import 'package:realestate/screans/register.dart';
// import 'package:realestate/screans/homepage.dart';
import 'package:realestate/screans/sign_up.dart';
// import 'package:realestate/screans/tap_screan.dart';

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
                padding: const EdgeInsets.symmetric(horizontal: 46),
                child: Image.asset('assets/images/onboarding.png'),
              ),
              SizedBox(height: 5,),
              Text(
                S.of(context).welcome,
                style: Theme.of(context).textTheme.titleLarge
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
          Column(
            children: [
              Center(
                child: Text(
                  S.of(context).welcome_t0,
                  style: Theme.of(context).textTheme.titleLarge
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    // Start with the default style from the current context
                    // style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      // TextSpan(
                      //     text: S.of(context).tO,
                      //     style: TextStyle(
                      //         color: Color.fromARGB(255, 0, 0, 0),
                      //         fontSize: 30,
                      //         fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: S.of(context).welcome_for,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                S.of(context).login_title,
                style: Theme.of(context).textTheme.titleMedium
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: (() => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignUp()))),
              child: Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent),
                child: Center(
                  child: Text(
                    S.of(context).register,
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                ),
              )),
          SizedBox(
            height: 7,
          ),
          GestureDetector(
            onTap: (() => Navigator.push(
                context, MaterialPageRoute(builder: (_) => Register()))),
            child: Center(
              child: RichText(
                text: TextSpan(
                  // Start with the default style from the current context
                  // style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: S.of(context).make_sure,
                        style: Theme.of(context).textTheme.titleMedium),
                    TextSpan(
                      text: S.of(context).ontap,
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
