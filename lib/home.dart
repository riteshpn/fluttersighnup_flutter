import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final _passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  String? _name;
  String? _email;

  String? _password;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Valid form, do something
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Sign Up'),
      ),
      body: Padding(
        padding:const  EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration:const InputDecoration(labelText: 'Enter Your Name'),
                validator: (value) {
                  if (value== null || value.isEmpty) {
                    return 'Name is required';
                  } else  {
                    return 'Invalid name format';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration:const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null ||value.isEmpty) {
                    return 'Email is required';
                  } else if (!_emailRegex.hasMatch(value)) {
                    return 'Invalid email format';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                decoration:const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null ||value.isEmpty) {
                    return 'Password is required';
                  } else if (!_passwordRegex.hasMatch(value)) {
                    return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              Padding(
                padding:const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child:const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
     ),
);}
}