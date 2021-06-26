import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentConfirmationPage extends StatefulWidget {
  @override
  _PaymentConfirmationState createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmationPage> {
  String reciepentName = '';
  String bank = '';
  String rekName = '';
  String totalPayment = '';

  void createRecord() {
    Firestore.instance.runTransaction((Transaction transsaction) async {
      CollectionReference reference =
          Firestore.instance.collection('Payment Confirmation');
      await reference.add({
        'Reciepent name': reciepentName,
        'From bank': bank,
        'From Rek. Name': rekName,
        'Total Payment': totalPayment,
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
            'PAYMENT CONFIRMATION',
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
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              onChanged: (String str) {
                setState(() {
                  reciepentName = str;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.indigo[400],
                  ),
                  labelText: 'Reciepent Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              onChanged: (String str) {
                setState(() {
                  bank = str;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.credit_card,
                    color: Colors.indigo[400],
                  ),
                  labelText: 'From Bank'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              onChanged: (String str) {
                setState(() {
                  rekName = str;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.star,
                    color: Colors.indigo[400],
                  ),
                  labelText: 'From Rek. Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: TextField(
              onChanged: (String str) {
                setState(() {
                  totalPayment = str;
                });
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.attach_money,
                    color: Colors.indigo[400],
                  ),
                  labelText: 'Total Payment'),
            ),
          ),
          SizedBox(
            height: 25,
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
                    "Confirm Payment",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                Text(
                  'Customer Service:',
                  style: TextStyle(
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '082298473333',
                ),
                Text('Glossypetals@gmail.com'),
              ],
            ),
          )
        ],
      )),
    );
  }
}

class Data extends StatelessWidget {
  IconData icon;
  String text;

  Data(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
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
