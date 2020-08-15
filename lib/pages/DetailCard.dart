import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/API/foodapi.dart';
import 'package:flutter_food_delivery/models/Food.dart';
import 'package:flutter_food_delivery/notifier/foodnotifier.dart';
import 'package:provider/provider.dart';
import 'UploadCard.dart';
class DetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    Future<void> _refreshList() async {
      getFoods(foodNotifier);
    }
    _onFoodDeleted(Food food) {
      Navigator.pop(context);
      foodNotifier.deleteFood(food);
    }
    // TODO: implement build
    return Scaffold(
      body: new RefreshIndicator(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top :20.0),

                  child: Image.network(foodNotifier.currentFood.image != null
                      ? foodNotifier.currentFood.image
                      : 'https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg',
                      height:300, width: 300,fit: BoxFit.fitHeight, ),
                ),
                Text(foodNotifier.currentFood.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Text(foodNotifier.currentFood.category,style: TextStyle(fontSize: 20,),),


              ],
            ),
          ),
        ),
        onRefresh: _refreshList,
      ),
        floatingActionButton:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: 'button1',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return UploadCard(
                      isUpdating: true,
                    );
                  }),
                );
              },
              child: Icon(Icons.edit),
              foregroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              heroTag: 'button2',
              onPressed: () => deleteFood(foodNotifier.currentFood, _onFoodDeleted),
              child: Icon(Icons.delete),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ],
        ),
    );
  }

}