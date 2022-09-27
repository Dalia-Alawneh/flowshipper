import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';


class ProductSlider extends StatefulWidget {
  ProductSlider({required this.imgPath1,required  this.imgPath2,required  this.imgPath3});
  final String imgPath1;
  final String imgPath2;
  final String imgPath3;

  @override
  _ProductSliderState createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  PageController controller = PageController();
  int _currentIndex = 0;
  List<String> offerPercentage = ['10%', '30%', '50%'];
  List<String> offerImage = [
    'images/p2.jpg',
    'images/p3.jpg',
    'images/p2.jpg',

  ];
  @override
  void initState() {
    /// initialized [conroller] after the screen is loaded
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    /// [conroller] remove from the widget tree permanantly after the screen is closed
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      // total height of the container [Image Box]
          child: Stack(
            children: [
              PageView.builder(
                controller: controller,
                itemCount: offerPercentage.length,
                scrollDirection:
                Axis.horizontal, // scrolling direction of image
                physics: ScrollPhysics(), // scrolling behaviour
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, i1) {
                  return Stack(
                    children: [
                      Image.asset(
                        offerImage[i1], // List of Offers precentages
                        width: MediaQuery.of(context).size.width,
                        colorBlendMode: BlendMode.softLight,
                        color: Colors.black.withOpacity(0.8),
                        fit: BoxFit.cover,
                      ),
                     //  end offers
                    ],
                  );
                },
              ),
              Positioned(
                bottom: 15, // Position form Bottom
                right: 15, // Position from Right
                child: Container(
                  height: 15,
                  child: ListView.builder(
                    itemCount: offerPercentage.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (BuildContext context, int i2) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 5,
                          width: 15,
                          decoration: _currentIndex == i2
                              ? BoxDecoration(
                              color: Colors
                                  .white, // Selected Slider Indicator Color
                              borderRadius: BorderRadius.circular(15))
                              : BoxDecoration(
                              color: Colors
                                  .black, // Unselected Slider Indicator Color
                              shape: BoxShape
                                  .circle // shape of Unselected indicator
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ) // end indicator
            ],
          ),

    );
  }
}

