import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list=[{
    'image':'https://unsplash.com/photos/-kOl_81lBd4'
  }];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: const Text("Your Orders",
              style:TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child:  Text("See all",
              style:TextStyle(
                color: GlobalVariables.selectedNavBarColor,
              )),
            )
          ],
        ),
        Container(
          height:170,
          padding: const EdgeInsets.only(left:20,top:20) ,
          child: ListView.builder(
            itemBuilder: (context,index){
              return Container();
            },
            itemCount: 3,
            ),
          ),

      ],
    );
  }
}