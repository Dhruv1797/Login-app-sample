import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_1/content.dart';

import 'package:project_1/intro_page.dart';
import 'package:project_1/sign_up.dart';

class Login extends StatefulWidget {
  static const routeName = '/login-page';
  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  bool _switchValue = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      onSaved: (value) {
        emailController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your Email";
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: new BorderSide(color: Colors.teal),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: "Enter Email i'd",
          fillColor: Colors.white70),
    );
    final PasswordField = TextFormField(
      obscureText: true,
      autofocus: false,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: new BorderSide(color: Colors.teal),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: "Enter password",
          fillColor: Colors.white70),
    );

    // final loginButton = Material(
    //   elevation: 5,
    //   borderRadius: BorderRadius.circular(30),
    //   color: Colors.teal,
    //   child: MaterialButton(
    //       padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       minWidth: MediaQuery.of(context).size.width,
    //       onPressed: () {
    //         SignupFun(emailController.text, passwordController.text);
    //       },
    //       child: Text(
    //         "Login",
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //             fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    //       )),
    // );

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back,
      //       size: 40,
      //     ),
      //   ),
      // ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            height: deviceSize.height,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Theme.of(context).primaryColor,
                  height: deviceSize.height,
                  width: deviceSize.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: deviceSize.height * 0.040,
                        width: double.infinity,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 40,
                            ),
                          ),
                          Container(
                            width: deviceSize.width * 0.5,
                          ),
                          Text('Need some help?'),
                          Container(
                            width: deviceSize.width * 0.01,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: deviceSize.height * 0.86,
                      width: deviceSize.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          // color: Colors.red,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 0,
                                    width: deviceSize.width * 0.07,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: deviceSize.height * 0.05,
                                        width: 0,
                                      ),
                                      Text(
                                        "Getting started",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        height: 10,
                                        width: 0,
                                      ),
                                      Text(
                                        "Create account to continue!",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Container(height: 30, width: 0),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.black54,
                                                    blurRadius: 10.0,
                                                  ),
                                                ],
                                              ),
                                              child: FittedBox(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  child: Image.network(
                                                      'https://cdn-icons-png.flaticon.com/512/281/281764.png'),
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Container(height: 0, width: 20),
                                          GestureDetector(
                                            child: Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.black54,
                                                    blurRadius: 10.0,
                                                  ),
                                                ],
                                              ),
                                              child: FittedBox(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  child: Image.network(
                                                      'https://cdn-icons-png.flaticon.com/512/5968/5968764.png'),
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Container(height: 0, width: 20),
                                          GestureDetector(
                                            child: Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.black54,
                                                    blurRadius: 10.0,
                                                  ),
                                                ],
                                              ),
                                              child: FittedBox(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.0),
                                                  child: Image.network(
                                                      'https://cdn-icons-png.flaticon.com/512/2504/2504839.png'),
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 0,
                                        width: 20,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 40,
                                width: double.infinity,
                                // color: Colors.amber,
                              ),
                              Container(
                                height: 15,
                                width: double.infinity,
                                // color: Colors.amber,
                              ),
                              Container(
                                width: deviceSize.width * 0.87,
                                color: Colors.white,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      emailField,
                                      Container(
                                        height: 30,
                                        width: double.infinity,
                                        // color: Colors.amber,
                                      ),
                                      PasswordField,
                                      Container(
                                        height: 30,
                                        width: double.infinity,
                                        // color: Colors.amber,
                                      ),
                                      // loginButton,
                                    ],
                                  ),
                                ),
                                // color: Colors.amber,
                              ),

                              // SizedBox(
                              //   width: deviceSize.width * 0.9,
                              //   child: TextField(
                              //     decoration: InputDecoration(
                              //         prefixIcon: Icon(Icons.person),
                              //         border: OutlineInputBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(100.0),
                              //           borderSide: new BorderSide(
                              //               color: Colors.teal),
                              //         ),
                              //         filled: true,
                              //         hintStyle:
                              //             TextStyle(color: Colors.grey[800]),
                              //         hintText: "Enter Email i'd",
                              //         fillColor: Colors.white70),
                              //   ),
                              // ),
                              // Container(
                              //   height: 20,
                              //   width: double.infinity,
                              //   // color: Colors.amber,
                              // ),
                              // SizedBox(
                              //   width: deviceSize.width * 0.9,
                              //   child: TextField(
                              //     decoration: InputDecoration(
                              //         prefixIcon: Icon(Icons.lock),
                              //         border: OutlineInputBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(100.0),
                              //           borderSide:
                              //               new BorderSide(color: Colors.teal),
                              //         ),
                              //         filled: true,
                              //         hintStyle:
                              //             TextStyle(color: Colors.grey[800]),
                              //         hintText: "Enter password",
                              //         fillColor: Colors.white70),
                              //   ),
                              // ),
                              Container(
                                height: 15,
                                width: double.infinity,
                                // color: Colors.amber,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Remider me next time ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Switch(
                                    value: _switchValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _switchValue = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                height: 7,
                                width: double.infinity,
                                // color: Colors.amber,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.pushReplacement<void, void>(
                                  //   context,
                                  //   MaterialPageRoute<void>(
                                  //     builder: (BuildContext context) =>
                                  //         const content(),
                                  //   ),
                                  // );
                                  SignupFun(emailController.text,
                                      passwordController.text);
                                },
                                child: Container(
                                  width: deviceSize.width * 0.6,
                                  height: deviceSize.height * 0.05,
                                  child: Center(
                                    child: Text(
                                      'LOGIN IN',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.teal,
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: deviceSize.width * 0.23,
                                      ),
                                      Center(
                                          child: Text(
                                              'Dont have a account signup ?')),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed(signup.routeName);
                                        },
                                        child: Text('Sign up'),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void SignupFun(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login  sucessfully done"),
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => content()),
                ),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
