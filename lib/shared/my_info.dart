import 'package:flutter/material.dart';
import 'package:flutter_app3/shared/rounded_image.dart';
import 'package:flutter_app3/styleguide/text_style.dart';
import 'package:flutter_app3/shared/radial_progress.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadialProgress(
            width:4,
            goalCompleted: 0.9,
            child: RounderImage(

              imagePath:"assets/images/anne.jpeg",
              size: Size.fromWidth(120.0),
            ),
          ),

          SizedBox(height:10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Geeta Grethe",
                style:whiteNameTextStyle,
              ),
              Text(
                ",24",
                style: whiteNameTextStyle,
              ),

            ],
          ),
        SizedBox(height:10,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/icons/location_pin.png",
                width: 20.0,
                color: Colors.white,
              ),
              Text(
                "35 km",
                style:whiteSubHeadingTextStyle,
              )
            ],

        ),
        ],
      ) ,
    );
  }
}
