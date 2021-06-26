import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        backgroundColor: Colors.indigo[400],
      ),
      body: new Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ShopClass(),
          ],
        ),
      ),
    );
  }
}

class ShopClass extends StatelessWidget {
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
                    'https://data.whicdn.com/images/336647638/original.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0, top: 50.0),
                child: Container(
                    child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Bouquet Flower',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text("Rp. 550.000",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 15.0,
                              ),
                      FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0)),
                        color: Colors.red,
                        textColor: Colors.white,
                        padding: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                        onPressed: () {},
                        child: Text(
                          "CLEAR",
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
