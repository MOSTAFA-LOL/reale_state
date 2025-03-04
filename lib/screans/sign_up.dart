import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:realestate/generated/l10n.dart';
// import 'package:realestate/screans/homepage.dart';
import 'package:realestate/screans/register.dart';
// import 'package:realestate/screans/homepage.dart';
import 'package:realestate/screans/tap_screan.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

Color color = Colors.blueAccent;

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String?  email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset(
                'assets/images/R.png', // Replace with your image path

                height: 200, // Adjust the height as needed
              ),
              SizedBox(height: 15),
              Text(
                S.of(context).login_title2,
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black,),
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),)
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              // password
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: color,),
                  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),),
                  suffix: Icon(
                    Icons.visibility,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  hintText: S.of(context).text_field1,
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => password = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your password';
                  }else{
                  return null;
                  }
                  
                },
              ),
              SizedBox(
                height: 10,
              ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState!.save();
                  
                    // ignore: avoid_print
                    print('$email');
                    // ignore: avoid_print
                    print('$password');
                    // Process the registration data here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('access the gmail')),
                    );
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => TapScrean()));
                  }
                },
                child: Text('Log In',
                style: TextStyle(color: color),),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));
                  },
                  child: Center(child: Text('Sign Up to new account',
                  style: TextStyle(color: color),)))
            ],
          ),
        ),
      ),
    );
  }
}
