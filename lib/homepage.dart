import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

//import pages
import './cart.dart';
import './checkout.dart';
import './confirm.dart';
import './login.dart';

class HomePage extends StatefulWidget {
  HomePage({this.user, this.googleSignIn});

  final FirebaseUser user;
  final GoogleSignIn googleSignIn;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<LogInPage> _signOut() async {
    await FirebaseAuth.instance.signOut();

    return new LogInPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Glossy Petals',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[400],
        
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo[400]),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Material(
                        color: Color(0xFFE9FDFB),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        child: Padding(
                          padding: EdgeInsets.all(13.0),
                          child: Image.asset(
                            'img/Rectangle24.png',
                            width: 100,
                            height: 100,
                          ),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListNavbar(Icons.shopping_cart, 'Shopping Cart', () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new ShoppingCart()));
            }),
            ListNavbar(Icons.monetization_on, 'Checkout', () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new CheckoutPage()));
            }),
            ListNavbar(Icons.insert_comment, 'Payment Confirmation', () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new PaymentConfirmationPage()));
            }),
            SizedBox(height: 140),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0)),
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(70.0, 12.0, 70.0, 12.0),
                  onPressed: () {
                    _signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return LogInPage();
                    }), ModalRoute.withName('/'));
                  },
                  child: Text(
                    "sign out".toUpperCase(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: new Container(
        padding: EdgeInsets.only(top: 20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Atas(),
            Product(
                "https://images.squarespace-cdn.com/content/v1/536527a6e4b0a8d04d940548/1494608179077-MFVRA4Y3M8Y3ETM6UL0C/ke17ZwdGBToddI8pDm48kOfob-yUy7IEHnzhESKCkHp7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1Ua7izKLPaGqtSAbX-9fl2TAlYj36nxib5ikCQEX8BV68aOCCIXqnhiPbQDAtWz_x5A/a.jpg?format=300w",
                'Single Flower',
                '550.000'),
            Product('https://data.whicdn.com/images/336647638/original.jpg',
                'Bouquet Flower', '550.000'),
            Product("https://data.whicdn.com/images/330242752/original.jpg",
                'Blossom Box', '550.000'),
            Product(
                "https://data.whicdn.com/images/234789527/superthumb.jpg?t=1460551198",
                'Bouquet Flower',
                '550.000')
          ],
        ),
      ),
    );
  }
}

class Atas extends StatefulWidget {
  @override
  _AtasState createState() => _AtasState();
}

class _AtasState extends State<Atas> {
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
              image: AssetImage('img/Rectangle24.png'),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            "Your Favourite Flowers",
            style: TextStyle(letterSpacing: 1.5, color: Colors.black54),
          ),
          Divider(
            color: Colors.black54,
          ),
          Text(
            "Spread the love with our flower collection",
            style: TextStyle(
                color: Colors.indigo[400],
                fontFamily: 'DancingScript',
                fontSize: 35),
          ),
        ],
      ),
    );
  }
}

class Product extends StatelessWidget {
  String imgUrl;
  String itemName;
  String price;

  Product(this.imgUrl, this.itemName, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 15),
      child: Row(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 220,
                width: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, top: 50.0),
                child: Container(
                    child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        itemName,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Rp. ' + price,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0)),
                        color: Colors.indigo[400],
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(50.0, 12.0, 50.0, 12.0),
                        onPressed: () {},
                        child: Text(
                          "BUY",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ListNavbar extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  ListNavbar(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.indigo[400]))),
        child: InkWell(
          splashColor: Colors.indigo[400],
          onTap: onTap,
          child: Container(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.indigo[400]),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
