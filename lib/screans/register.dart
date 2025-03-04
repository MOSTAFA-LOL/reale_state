// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:realestate/screans/sign_up.dart';

import 'package:realestate/screans/tap_screan.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//التحكم في حاله النموذج مما يساعد علب تنظيم التحقق من المدخلا
  final _formKey = GlobalKey<FormState>();
  // Variables to store input values
  String? name, email, phone, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,),
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
              SizedBox(height: 11,),
              // Name Field
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onSaved: (value) => name = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Email Field
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
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
              SizedBox(height: 16),
              // Phone Number Field
              TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                keyboardType: TextInputType.phone,
                onSaved: (value) => phone = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length >= 12) {
                    return 'Password must be at 12 number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Password Field
              TextFormField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    )),
                obscureText: true,
                onSaved: (value) => password = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Confirm Password Field
              TextFormField(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    )),
                obscureText: true,
                onSaved: (value) => confirmPassword = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  // The password value will be available after onSaved has run
                  if (_formKey.currentState != null) {
                    _formKey.currentState!.save();
                    if (password != null && value != password) {
                      return 'Passwords do not match';
                    }
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState!.save();
                    print('$name');
                    print('$email');
                    print('$phone');
                    print('$password');
                    // Process the registration data here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('created gmail')),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TapScrean()));
                  }
                },
                child: Text('Register',
                style: TextStyle(color: color),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
