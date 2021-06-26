import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String receipentName = '';
  String address = '';
  String phoneNumber = '';
  String message = '';

  void createRecord() {
    Firestore.instance.runTransaction((Transaction transsaction) async {
      CollectionReference reference = Firestore.instance.collection('Orderan');
      await reference.add({
        'receipent name': receipentName,
        'address': address,
        'phone number': phoneNumber,
        'message': message,
      });
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'CHECKOUT',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
        backgroundColor: Colors.indigo[400],
      ),
      body: Container(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
            child: Text(
              'Recipient Detail',
              style: TextStyle(
                  color: Colors.indigo,
                  fontFamily: 'DancingScript',
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              onChanged: (String str) {
                setState(() {
                  receipentName = str;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.indigo[400],
                  ),
                  labelText: 'Recipient Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              onChanged: (String str) {
                setState(() {
                  address = str;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.home,
                    color: Colors.indigo[400],
                  ),
                  labelText: 'Address'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              onChanged: (String str) {
                setState(() {
                  phoneNumber = str;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Colors.indigo[400],
                  ),
                  labelText: 'Phone Number'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              onChanged: (String str) {
                message = str;
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.mail_outline,
                    color: Colors.indigo[400],
                  ),
                  labelText: 'Message (optional)'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 0, 25),
            child: Text(
              'How To Payment: ',
              style: TextStyle(
                  color: Colors.indigo,
                  fontFamily: 'DancingScript',
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Rek(),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: <Widget>[
                FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0)),
                  color: Colors.indigo[400],
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50.0, 17.0, 50.0, 17.0),
                  onPressed: () {
                    createRecord();
                  },
                  child: Text(
                    "Submit Order!".toUpperCase(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      )),
    );
  }
}

class Rek extends StatefulWidget {
  @override
  _RekState createState() => _RekState();
}

class _RekState extends State<Rek> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xfff0f0f0), width: 2))),
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.indigo[400])),
            child: Image(
              image: AssetImage('img/Group32.png'),
            ),
          ),
        ],
      ),
    );
  }
}
