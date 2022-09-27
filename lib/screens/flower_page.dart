import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: BackButton(color: Colors.red[800]),
        backgroundColor: Color(0xffDBDBDB),
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
              height: 293,
              image:AssetImage('images/flowerboq.jpg')),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 15,),
              Text("Pink Rose", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              Text('by Jarvis Pepperspary', style: TextStyle(color: Color(
                  0xffb1b1b1)),),
              SizedBox(height: 23,),
              Row(
                children: [
                  Text('\$150.00 ', style: TextStyle(color: Colors.red[900],fontSize:20,),),
                  Text(' \$200', style: TextStyle(color:Color(0xffb1b1b1),decoration: TextDecoration.lineThrough),),
                ],
              ),
              SizedBox(height: 23,),
              Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum'),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: OutlinedButton(
                   style: ButtonStyle(
                     padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(13)),
                     backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xffb40000)),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                           RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(18.0),
                               side: BorderSide(color: Color(0xffb40000))
                           )
                       )
                   ),
                    onPressed: (){}, child: Text("Buy Now", style: TextStyle(color: Colors.white),)),
              )
            ],
          ),)

        ],
      ),
    );
  }
}
