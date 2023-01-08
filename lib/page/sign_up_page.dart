import 'package:classroom_user/page/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/reusables.dart';
import '../widget/sign_resuable.dart';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _rollNoTextController = TextEditingController();
  final TextEditingController _classNoTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();

  bool _isloading = false;

  Future _signUp(String name, String email, String rollNo, String classNo,
      String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        User? user = credential.user;

        var docid =
            FirebaseFirestore.instance.collection("user").doc(user!.uid);
        Map<String, dynamic> userdata = {
          "name": name,
          "email": email,
          "rollNo": rollNo,
          "classNo": classNo,
          "id": docid.id,
        };
        FirebaseFirestore.instance
            .collection("user")
            .doc(docid.id)
            .set(userdata);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }

      Navigator.pushNamed((context), HomePage.routeName);

      setState(() {
        _isloading = false;
      });
    }
  }

  // void signUpUser() async {
  //   FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
  //     name: _nameTextController.text,
  //     email: _emailTextController.text,
  //     password: _passwordTextController.text,
  //     address: _addressTextController.text,
  //     phone: _phoneTextController.text,
  //     context: context,
  //   );
  //   var docid = FirebaseFirestore.instance.collection("userdata").doc();
  //   Map<String, dynamic> userdata = {
  //     "name": _nameTextController.text,
  //     "email": _emailTextController.text,
  //     "address": _addressTextController.text,
  //     "phone": _phoneTextController.text,
  //     "id": docid.id,
  //   };
  //   FirebaseFirestore.instance.collection("userdata").add(userdata);
  // }

  // Future signUp(String name, String rollNo, String ClassNo, String email,
  //     String password) async {
  //   try {
  //     final credential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: _isloading
          ? loader(context)
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 3, 0, 14),
                  Color.fromARGB(255, 2, 32, 57),
                  Color.fromARGB(255, 6, 63, 109),
                  Color.fromARGB(255, 14, 92, 156),
                  Colors.blue
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _nameTextController,
                        obscureText: false,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.account_circle_rounded,
                            color: Colors.white70,
                          ),
                          labelText: 'Enter your Name',
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          // Check if this field is empty
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          // the email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailTextController,
                        obscureText: false,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.white70,
                          ),
                          labelText: 'Enter your email',
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          // Check if this field is empty
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          // using regular expression
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter a valid email address";
                          }

                          // the email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _rollNoTextController,
                        obscureText: false,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.location_city_rounded,
                            color: Colors.white70,
                          ),
                          labelText: 'Enter your Roll no',
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          // Check if this field is empty
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          // the email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _classNoTextController,
                        obscureText: false,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.white70,
                          ),
                          labelText: 'Enter your Class no',
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          // Check if this field is empty
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          // the email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordTextController,
                        obscureText: true,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white70,
                          ),
                          labelText: 'Create a password',
                          labelStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          // Check if this field is empty
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }

                          // the email is valid
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      firebaseUIButton(context, "Sign Up", () {
                        _signUp(
                            _nameTextController.text,
                            _emailTextController.text,
                            _rollNoTextController.text,
                            _classNoTextController.text,
                            _passwordTextController.text);
                      })
                    ],
                  ),
                ),
              ))),
    );
  }
}
