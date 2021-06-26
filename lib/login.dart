import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glossypetals2/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<String> _signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();

    assert(user.uid == currentUser.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/original2.jpg'), fit: BoxFit.cover)),
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromRGBO(162, 146, 199, 0.7),
                  Color.fromRGBO(51, 51, 63, 0.4),
                ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter)),
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 270.0),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 65,
                              ),
                              GoogleSignInButton(
                                onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return HomePage();
                                        },
                                      ),
                                    );
                                  
                                
                                })
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
