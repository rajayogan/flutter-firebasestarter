import 'package:flutter/material.dart';

//services
import 'services/usermanagement.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;
  String _nickName;

  @override
  Widget build(BuildContext context) {
    // return new Scaffold(
    //     body: Center(
    //   child: Container(
    //       padding: EdgeInsets.all(25.0),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           TextField(
    //               decoration: InputDecoration(hintText: 'Email'),
    //               onChanged: (value) {
    //                 setState(() {
    //                   _email = value;
    //                 });
    //               }),
    //           SizedBox(height: 15.0),
    //           TextField(
    //               decoration: InputDecoration(hintText: 'Password'),
    //               obscureText: true,
    //               onChanged: (value) {
    //                 setState(() {
    //                   _password = value;
    //                 });
    //               }),
    //           SizedBox(height: 15.0),
    //           TextField(
    //               decoration: InputDecoration(hintText: 'Nick Name'),
    //               onChanged: (value) {
    //                 setState(() {
    //                   _nickName = value;
    //                 });
    //               }),
    //           SizedBox(height: 20.0),
    //           RaisedButton(
    //             child: Text('Sign Up'),
    //             color: Colors.blue,
    //             textColor: Colors.white,
    //             elevation: 7.0,
    //             onPressed: () {

    //             }
    //           )

    //         ],
    //       )),
    // ));
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        onChanged: (val) {
                          _email = val;
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        onChanged: (val) {
                          _password = val;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'NICK NAME ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        onChanged: (val) {
                          _nickName = val;
                        },
                      ),
                      SizedBox(height: 50.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.teal,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _email, password: _password)
                                    .then((signedInUser) {
                                  var userUpdateInfo = new UserUpdateInfo();
                                  userUpdateInfo.displayName = _nickName;
                                  userUpdateInfo.photoUrl =
                                      'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg';
                                  FirebaseAuth.instance
                                      .updateProfile(userUpdateInfo)
                                      .then((user) {
                                    FirebaseAuth.instance
                                        .currentUser()
                                        .then((user) {
                                      UserManagement()
                                          .storeNewUser(user, context);
                                    }).catchError((e) {
                                      print(e);
                                    });
                                  }).catchError((e) {
                                    print(e);
                                  });
                                }).catchError((e) {
                                  print(e);
                                });
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]));
  }
}
