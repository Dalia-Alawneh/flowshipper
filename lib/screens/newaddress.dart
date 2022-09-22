import 'package:flowshipper/screens/profile.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:dotted_border/dotted_border.dart';

import 'languages.dart';

enum SingingCharacter { address1, address2 }

class NewAddress extends StatefulWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  SingingCharacter? _character = SingingCharacter.address1;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Align(
          widthFactor: 6,
          alignment: Alignment.center,
          child: Text('Address Setting', style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      endDrawer: DrawerScreen(),
      body: SafeArea(
        child: ListView(
            children: [
        Padding(
        padding: EdgeInsets.only(top:60, bottom: 10),
        child: Image.asset(
          'images/address.png',
          width: 100,
          height: 100,
        ),
      ),
      Text('Add Address', style: TextStyle(
        fontSize: 18, color: Colors.black87,
        letterSpacing: 0.9,
      ),textAlign: TextAlign.center,),
      Padding(
        padding: EdgeInsets.only(left: 65,right: 65, top: 10, bottom: 40),
        child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.' , style: TextStyle(
          fontSize: 13, color: Colors.black54,
          letterSpacing: 0.9,
        ),textAlign: TextAlign.center,),
      ),

      ListTile(
        title: Text('02113, 71, Charter str, App. 5r, Boston, MA, USA', style: TextStyle(
            color: Colors.black54, fontSize: 18
        ),),
        leading: Transform.scale(
          scale: 1.3,
          child: Radio<SingingCharacter>(
            activeColor: Color.fromRGBO(246, 188, 1, 1),
            // overlayColor: MaterialStateProperty.all(Colors.black54),
            value: SingingCharacter.address1,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      ListTile(
        title: Text('21324, 37, Branderburg str, App, 14b, Boston, MA, USA', style: TextStyle(
            color: Colors.black54, fontSize: 18
        ),),
        leading: Transform.scale(
          scale: 1.3,
          child: Radio<SingingCharacter>(
            activeColor: Color.fromRGBO(246, 188, 1, 1),
            // fillColor: MaterialStateProperty.all(Color.fromRGBO(246, 188, 1, 1)),
            value: SingingCharacter.address2,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ),

              Padding(
                padding: EdgeInsets.only(left: 45, right: 45, top: 30, bottom: 30),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(25),
                  padding: EdgeInsets.only(left: 20, right: 20, top:6, bottom: 6),
                  color: Colors.grey,
                  dashPattern: [10,5,10,5,10,5],
                  child: TextFormField(
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: 14.0,
                      ),
                      border: InputBorder.none,
                      hintText: ChooseLang.lang? 'اضف عنوان استلام جديد':'Add a New Delivery Address',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only( left: 40, right: 40, ),
                child: Directionality(
                  textDirection: ChooseLang.lang? TextDirection.rtl: TextDirection.ltr,
                  child: SlideAction(
                    height: 60,
                    submittedIcon: Icon(Icons.save,),
                    sliderButtonYOffset: -8,
                    reversed: true,
                    sliderButtonIcon: Icon(Icons.close,color: Colors.red, size: 28,),
                    text:ChooseLang.lang?'حفظ العنوان الجديد' : "SAVE NEW ADDRESS",
                    textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),
                    key: _key,
                    onSubmit: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ProfileScreen();
                      }));
                      Future.delayed(
                        Duration(seconds: 1),
                            () => _key.currentState?.reset(),
                      );
                    },
                    innerColor: Colors.white,
                    outerColor: Color.fromRGBO(246, 188, 1, 1),
                  ),
                ),
              ),
      ]
    ),
    ),
    );
  }
}
