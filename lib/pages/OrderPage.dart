import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/Widget/OrderCard.dart';
class OrderPage extends StatefulWidget{


  @override
  _OrderPageState createState() => _OrderPageState();

}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        OrderCard(),
      ],
    );
  }
}