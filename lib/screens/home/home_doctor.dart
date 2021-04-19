import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_app3/styleguide/colors.dart';
import 'package:flutter_app3/shared/opaque_image.dart';

import 'package:flutter_app3/shared/my_info_doc.dart';
import 'package:flutter_app3/shared/profile_info_big_cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app3/shared/radial_progress.dart';
import 'package:flutter_app3/styleguide/text_style.dart';
import 'package:flutter_app3/shared/profile_info_card.dart';
import 'package:flutter_app3/models/brew.dart';
import 'package:flutter_app3/styleguide/colors.dart';
import 'package:flutter_app3/services/auth.dart';
import 'package:flutter_app3/services/database_doctor.dart';
import 'package:flutter_app3/screens/home/settings_form_doctor.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app3/screens/chatbot/convai.dart';
import 'package:flutter_app3/video_call/HomePage.dart';
import 'package:flutter_app3/screens/home/home.dart';
import 'package:flutter_app3/screens/chatbot/gpt.dart';
import 'package:image_picker/image_picker.dart';
class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final AuthService _auth = AuthService();

PickedFile _imageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              TextButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
      // print('objectfcgv hbndcfvgbh1234567');
      // var document =
      //     Firestore.instance.collection('brews').document(globals.uid);
      // var amit = document.get();

      // print('op');

      // print('amit123456789');
    });
  }

  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (conext) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    final screenHeight = MediaQuery.of(context).size.height;

    return StreamProvider<List<Doctor>>.value(
      value: DoctorDatabaseService().doctor,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          backgroundColor:primaryColorOpacity,
          elevation: 0.0,
          actions: <Widget>[
            
           
           ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(primaryColorOpacity), //Background Color
                elevation: MaterialStateProperty.all(0), //Defines Elevation
                shadowColor:
                    MaterialStateProperty.all(primaryColorOpacity), //Defines shadowColor
              ),
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: <Widget>[
                      OpaqueImage(
                        imageUrl: "assets/images/background.jpg",
                      ),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              // Align(
                              //   alignment: Alignment.centerLeft,
                              //   // child: Text(
                              //   //   "My Profile",
                              //     // textAlign: TextAlign.left,
                              //     // style: headingTextStyle,
                              //   ),
                              // ),
                                Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RadialProgress(
                                    width: 4,
                                    goalCompleted: 0.9,
                                    child: CircleAvatar(
                                      backgroundImage: _imageFile == null
                                          ? AssetImage(
                                              "assets/images/doctor.jpg")
                                          : FileImage(File((_imageFile.path))),
                                      radius: 80.0,
                                      // size: Size.fromWidth(120.0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Therapist",
                                        // "SettingsForm()",
                                        style: whiteNameTextStyle,
                                      ),
                                      // Text(
                                      //   ",24",
                                      //   style: whiteNameTextStyle,
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // Image.asset(
                                      //   "assets/icons/location_pin.png",
                                      //   width: 20.0,
                                      //   color: Colors.white,
                                      // ),
                                      Text(
                                        "",
                                        style: whiteSubHeadingTextStyle,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.only(top: 50),
                    color: Colors.white,
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              },
                            child: ProfileInfoBigCard(
                              firstText: "Video call",
                              secondText: "",
                              icon: Icon(
                                Icons.star,
                                size: 32,
                                color: Colors.blue,
                              ),
                            ),
                            ),
                        GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MyAppState(),
                                  ),
                                );
                              },
                            child: ProfileInfoBigCard(
                              firstText: "Let's Chat",
                              secondText: "",
                              icon: Icon(
                                Icons.star,
                                size: 32,
                                color: Colors.blue,
                              ),
                            ),
                            ),
                            
                          ],
                        ),
                        TableRow(
                          children: [
                                 GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Convai(),
                                  ),
                                );
                              },
                              child: ProfileInfoBigCard(
                                firstText: "Convai",
                                secondText: "",
                                // icon: Image.asset(
                                //   "assets/icons/sad_smiley.png",
                                //   width: 32.0,
                                //   color: Colors.blue,
                                // ),
                                icon: Icon(
                                  Icons.star,
                                  size: 32,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              },
                              child: ProfileInfoBigCard(
                                firstText: "Patient",
                                secondText: "",
                                // icon: Image.asset(
                                //   "assets/icons/sad_smiley.png",
                                //   width: 32.0,
                                //   color: Colors.blue,
                                // ),
                              icon: Icon(
                                Icons.star,
                                size: 32,
                                color: Colors.blue,
                              ),
                              ),
                            ),
                          ],
                        ),
                        // TableRow(
                        //   children: [
                        //     ProfileInfoBigCard(
                        //       firstText: "13",
                        //       secondText: "5 page",
                        //       icon: Icon(
                        //         Icons.star,
                        //         size: 32,
                        //         color: Colors.blue,
                        //       ),
                        //     ),
                        //     GestureDetector(
                        //       onTap: () {},
                        //       child: ProfileInfoBigCard(
                        //         firstText: "21",
                        //         secondText: "6 page",
                        //         icon: Image.asset(
                        //           "assets/icons/sad_smiley.png",
                        //           width: 32.0,
                        //           color: Colors.blue,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: screenHeight * (4 / 9) - 80,
              left: 16,
              right: 16,
              child: Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _showSettingsPanel(),
                      child: ProfileInfoCard(
                          firstText: "      Setting      ", secondText: ""),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // ProfileInfoCard(
                    //   hasImage: true,
                    //   imagePath: "assets/icons/pulse.png",
                    // ),
                    SizedBox(
                      width: 10,
                    ),
                     GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()),
                        );
                        print(_imageFile.path);
                      },
                      child: ProfileInfoCard(
                          firstText: "      Camera      ", secondText: ""),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
