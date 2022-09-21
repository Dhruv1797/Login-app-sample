import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_1/Login_screen.dart';
import 'package:project_1/content.dart';

import 'package:project_1/intro_page.dart';
import 'package:project_1/model/user_modal.dart';

class signup extends StatefulWidget {
  static const routeName = '/signup-page';
  @override
  State<signup> createState() => _signupPageState();
}

class _signupPageState extends State<signup> {
  final _auth = FirebaseAuth.instance;
  bool _switchValue = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmpasswordEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      onSaved: (value) {
        emailEditingController.text = value!;
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
      controller: passwordEditingController,
      onSaved: (value) {
        passwordEditingController.text = value!;
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
      textInputAction: TextInputAction.next,
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
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      validator: (value) {
        if (confirmpasswordEditingController.text !=
            passwordEditingController.text) {
          return "Password dont match";
        }
        return null;
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
          hintText: "Confirm password",
          fillColor: Colors.white70),
    );

    return Scaffold(
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
                                width: deviceSize.width * 0.87,
                                color: Colors.white,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      emailField,
                                      Container(
                                        height: 20,
                                        width: double.infinity,
                                        // color: Colors.amber,
                                      ),
                                      PasswordField,
                                      Container(
                                        height: 20,
                                        width: double.infinity,
                                        // color: Colors.amber,
                                      ),
                                      confirmPasswordField,
                                    ],
                                  ),
                                ),
                                // color: Colors.amber,
                              ),
                              // SizedBox(
                              //   width: deviceSize.width * 0.9,
                              //   child: TextField(
                              //     decoration: InputDecoration(
                              //         prefixIcon: Icon(Icons.email),
                              //         border: OutlineInputBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(100.0),
                              //           borderSide:
                              //               new BorderSide(color: Colors.teal),
                              //         ),
                              //         filled: true,
                              //         hintStyle:
                              //             TextStyle(color: Colors.grey[800]),
                              //         hintText: " Enter Email",
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
                              //         prefixIcon: Icon(Icons.person),
                              //         border: OutlineInputBorder(
                              //           borderRadius:
                              //               BorderRadius.circular(100.0),
                              //           borderSide:
                              //               new BorderSide(color: Colors.teal),
                              //         ),
                              //         filled: true,
                              //         hintStyle:
                              //             TextStyle(color: Colors.grey[800]),
                              //         hintText: "Enter User id",
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
                                  signupfun(emailEditingController.text,
                                      passwordEditingController.text);
                                },
                                child: Container(
                                  width: deviceSize.width * 0.6,
                                  height: deviceSize.height * 0.05,
                                  child: Center(
                                    child: Text(
                                      'SIGN UP',
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
                                              'Already have an account ?')),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed(Login.routeName);
                                        },
                                        child: Text('Sign in'),
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

  void signupfun(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsTOFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsTOFirestore() async {
    //calling our firestore
    //calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created sucessfully ");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }
}
