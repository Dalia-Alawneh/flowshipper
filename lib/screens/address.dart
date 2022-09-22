import 'package:flowshipper/screens/profile.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'languages.dart';
import 'package:slide_to_act/slide_to_act.dart';

import 'newaddress.dart';

enum SingingCharacter { address1, address2 }

class AddressSetting extends StatefulWidget {
  const AddressSetting({Key? key}) : super(key: key);

  @override
  State<AddressSetting> createState() => _AddressSettingState();
}

class _AddressSettingState extends State<AddressSetting> {
  final GlobalKey<SlideActionState> _key = GlobalKey();
  SingingCharacter? _character = SingingCharacter.address1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.only(bottom: 0, left: 40, right: 40, top: 40),
        child: Directionality(
          textDirection: ChooseLang.lang? TextDirection.rtl: TextDirection.ltr,
          child: SlideAction(
            height: 60,
            submittedIcon: Icon(Icons.add),
            sliderButtonYOffset: -8,
            reversed: true,
            sliderButtonIcon: Icon(Icons.add, size: 28,),
            text:ChooseLang.lang?'اضافة عنوان جديد' : "ADD NEW ADDRESS",
            textStyle: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
            key: _key,
            onSubmit: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return NewAddress();
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
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: ListTile(
            tileColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30),
              ),),
            leading: Padding(
                padding: EdgeInsets.only(left: 100),
                child: Icon(Icons.save, size: 20,)),
            iconColor: Colors.white,
            title: Text(ChooseLang.lang? 'حفظ':'SAVE',
                // textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 18,
                    letterSpacing: 1.1)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
            },
          )),
      ]
    ),
    ),
    );
  }
}
