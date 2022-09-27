
import 'package:flutter/material.dart';
class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                color: Color(0x9c77dc66),
                child: Text('\$170.90',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)),
            OutlinedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 2, horizontal: 60)),
                      backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xffb40000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color(0xffb40000))
                          )
                      )
                  ),
                  onPressed: (){}, child: Text("Buy Now", style: TextStyle(color: Colors.white),)),

          ],
        ),
      ),
      appBar: AppBar(
        leading: BackButton(color: Colors.red[800]),
        backgroundColor: Color(0xffEBEAF0),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.favorite_border, color: Colors.red,),
          )
        ],
      ),
      body: ListView(
        children: [
          // Expanded(
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: [
          //
          //     ],
          //   ),
          // )
          Image(
            width: double.infinity,
              height: 313,
              image:AssetImage('images/hh.jpg')),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 15,),
                Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(

                              children: [
                                Icon(Icons.location_on),
                                Text('Sending Address'),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(Icons.edit ,color: Color(0xffb40000),),
                                Text('Change', style: TextStyle(color: Color(0xffb40000)),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Boorklet, Georgia(GA), 30415 - Ga 46 Hwy')),
                    ],
                  ),
                ),
                 SizedBox(height: 23,),
                Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(

                              children: [
                                Icon(Icons.calendar_month),
                                Text('Delivery Date / Time'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 23,),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.file_present_outlined),
                                  Text('Description'),

                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text('Lisyantus White: 12 pieces'),
                        SizedBox(height: 5,),
                        Text('Lisyantus Pink : 14 pieces'),
                        SizedBox(height: 5,),
                        Text('Lisyantus Purple : 8 pieces'),
                        SizedBox(height: 5,),
                        Text('Nulla eu tempor tortor. Sed laculis sitamet purus eu pharetra.')


                      ],
                    ),
                  ),
                ),

              ],
            ),)

        ],
      ),
    );
  }
}
