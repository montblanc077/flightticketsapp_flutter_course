import 'package:flutter/material.dart';
import 'package:flighttickets/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flighttickets/screens/home_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(color: mainColor),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF),
        leading: IconButton(
            color: mainColor,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  cursorColor: mainColor,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: loginTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 150.0),
                child: TextField(
                  cursorColor: mainColor,
                  obscureText: true,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: loginTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
              ),
              RaisedButton(
                color: Colors.white,
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Color(0xFF222533),
                      fontWeight: FontWeight.normal,
                      fontSize: 18.0),
                ),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
