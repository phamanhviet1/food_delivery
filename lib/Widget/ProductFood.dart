
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/models/Product.dart';
List<Product>items=[
  Product(name: "Hot Coffee",url: "assets/images/breakfast.jpeg",rating: 10.0,time: 5),
  Product(name: "Fried-Fish",url: "assets/images/lunch.jpeg",rating: 20.0,time: 10),
  Product(name: "Fried-rices",url: "assets/images/supper_1.jpeg",rating: 30.0,time: 15),

];
class ProductFood extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 480,
        child:
       ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          itemBuilder: (_,index) {
            return Stack(children: <Widget>[
              Container(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(items[index].url),
                  ),
                ),
              ),
              Positioned(
                left: 8, bottom: 8, right: 8,
                child: Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.black12],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topCenter
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                  left: 15, bottom: 10, right: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Text("Hot Coffee",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
                      Column(
                        children: <Widget>[
                          Text(items[index].name, style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),),
                          Row(children: <Widget>[
                            Icon(Icons.star, size: 12, color: Colors.blue,),
                            Icon(Icons.star, size: 12, color: Colors.blue,),
                            Icon(Icons.star, size: 12, color: Colors.blue,),
                            Icon(Icons.star, size: 12, color: Colors.blue,),
                            Icon(
                              Icons.star_border, size: 12, color: Colors.blue,),
                            Text('  (${items[index].rating} reviewer)',
                              style: TextStyle(color: Colors.yellow),)

                          ],)
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(items[index].time.toString(), style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),),
                          Text("Min Order")
                        ],
                      ),

                    ],
                  )
              )


            ],

            );
          }
       ),

    );
  }

}