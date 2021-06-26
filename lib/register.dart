import 'package:flutter/material.dart';
import 'package:glossypetals2/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Here!',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        backgroundColor: Colors.indigo[400],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Isi(Icons.person_outline, 'Name'),
          Isi(Icons.person_add, 'Username'),
          Isi(Icons.mail, 'E-mail'),
          Isi(Icons.lock, 'Password'),
          SizedBox(
            height: 80,
          ),
          FlatButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0)),
            color: Colors.indigo[400],
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(50.0, 17.0, 50.0, 17.0),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new LogInPage()));
            },
            child: Text(
              "Tap to Register",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class Isi extends StatelessWidget {
  IconData icon;
  String text;

  Isi(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      child: TextField(
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.indigo[400],
            ),
            labelText: text),
      ),
    );
  }
}
