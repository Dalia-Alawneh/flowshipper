import 'package:flowshipper/screens/code_screen.dart';
import 'package:flowshipper/screens/tapscreen.dart';
import 'package:flowshipper/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'drawer.dart';
import 'languages.dart';
import 'package:dotted_border/dotted_border.dart';
import 'reusable_bar.dart';
import 'my_tab_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: ChooseLang.lang? TextDirection.rtl : TextDirection.ltr,
        child: DefaultTabController(
            length: 5,
          child: Scaffold(
            bottomNavigationBar:ReusableBottomBar(),
            // drawer: ,
            endDrawer: DrawerScreen(),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: BackButtonIcon(),
              title: Text(ChooseLang.lang? 'الازهار':'Flowers 435 places'),
              centerTitle: true,
            ),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 30,right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Top Categories',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                      ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.search,color:Color(0xffc2c2c2),),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(FontAwesomeIcons.sliders,size:20,color:Color(0xffc2c2c2)),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FlowerCard(imgPath: 'images/flower.png',title: 'Flower', quntity: '135 places'),
                          FlowerCard(imgPath: 'images/indoor.png',title: 'Plant Indoor', quntity: '174 places'),
                          FlowerCard(imgPath: 'images/outdoor.png',title: 'Plant Outdoor', quntity: '36 places'),
                          FlowerCard(imgPath: 'images/plots.png',title: 'Plots', quntity: '26 places'),
                          FlowerCard(imgPath: 'images/indoor.png',title:'Plant Indoor', quntity: '174 places'),
                        ],

                      ),
                    ),

                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  height: MediaQuery.of(context).size.height/14,
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding:EdgeInsets.only(left: 15),
                      children: [
                        ButtonListItem('Over 4.5 ⭐'),
                        ButtonListItem('Browse by Bouquets'),
                        ButtonListItem('by Flowers in Box'),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: ListView(
                      children: [
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FlowerItem(
                                'images/flo2.png',
                                'FlowerStore',
                                '65.00',
                                '4.5',
                                '35',
                                '2.45'
                            ),
                            FlowerItem(
                                'images/flo5.png',
                                'Flower Shop',
                                '90.00',
                                '4.3',
                                '30',
                                '4.60'
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            FlowerItem(
                                'images/flo4.png',
                                'FlowerStore',
                                '65.00',
                                '4.5',
                                '35',
                                '2.45'
                            ),
                            FlowerItem(
                                'images/flo4.png',
                                'Flower Shop',
                                '90.00',
                                '4.3',
                                '30',
                                '4.60'
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),



                      ],
                    ),
                  ),
                )

              ],
            )

          ),
        ),
    );
  }
}



class FlowerItem extends StatelessWidget {
  const FlowerItem(this.imgPath, this.shopName, this.price, this.rate, this.time, this.delPrice);
  final String imgPath;
  final String shopName;
  final String price;
  final String time;
  final String rate;
  final String delPrice;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DottedBorder(
            borderType: BorderType.RRect,
            padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
            color: Color(0xffa1a1a1),
            radius: Radius.circular(12),
            dashPattern: [10,5,10,5,10,5],
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(imgPath,width: 100,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$price\$', style: TextStyle(color: Colors.red),),
                    SizedBox(width: 15,),
                    Icon(Icons.shopping_bag_outlined, size: 17,)
                  ],
                )
              ],
            ),
        ),
        SizedBox(height: 10,),
        Text('$shopName / $rate ⭐', style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text('Cras blandit conseqat..'),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('$time min-Delivery  ', style: TextStyle(fontSize: 11),),
          Text('$delPrice\$', style: TextStyle(fontSize: 11 ,color: Colors.red)),
        ],)
      ],
    );
  }
}

class ButtonListItem extends StatefulWidget {
  final String text;

  ButtonListItem(this.text);

  @override
  State<ButtonListItem> createState() => _ButtonListItemState();
}

class _ButtonListItemState extends State<ButtonListItem> {
  int bgColor = 0xffffffff;
  int textColor = 0xff000000;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(right: 15),
      decoration:BoxDecoration(
      color: Color(bgColor),
        border:Border.all(),
        borderRadius: BorderRadius.circular(20)
      ),
      child: GestureDetector(

        //
        // onPressed: (){
        //     setState((){
        //         bgColor = 0xffffffff;
        //         textColor = 0xff000000;
        //     });
        // },
          onTap: (){
          setState((){
            bgColor = 0xffffffff;
            textColor = 0xff000000;
          });
        },
      onDoubleTap: (){
        setState((){
          bgColor = 0xff1e5707;
          textColor = 0xffffffff;
        });
      },
          child: Center(
            child: Text(widget.text,
                style:TextStyle(color:Color(textColor))),
          )),

    );
  }
}

class FlowerCard extends StatelessWidget {
  FlowerCard({required this.imgPath, required this.title, required this.quntity});
  final String imgPath;
  final String title;
  final String quntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
              color: Color(0xffa1a1a1),
              radius: Radius.circular(12),
              dashPattern: [10,5,10,5,10,5],
              child: Image(
                width: 80,
                height: 80,
                image:AssetImage(imgPath),
              )),
            SizedBox(
              height: 15,
            ),
            Text(title,
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.start,

            ),
            Text(quntity, textAlign: TextAlign.start),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
