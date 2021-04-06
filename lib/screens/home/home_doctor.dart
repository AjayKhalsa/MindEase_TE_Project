import 'package:flutter/material.dart';
// import 'package:flutter_app3/styleguide/colors.dart';
import 'package:flutter_app3/shared/opaque_image.dart';

import 'package:flutter_app3/shared/my_info.dart';
import 'package:flutter_app3/shared/profile_info_big_cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app3/shared/profile_info_card.dart';
import 'package:flutter_app3/models/brew.dart';
import 'package:flutter_app3/styleguide/colors.dart';
import 'package:flutter_app3/services/auth.dart';
import 'package:flutter_app3/services/database_doctor.dart';
import 'package:flutter_app3/screens/home/settings_form_doctor.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app3/video_call/HomePage.dart';
import 'package:flutter_app3/screens/home/home.dart';

class DoctorScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
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
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            
           
           ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(brown), //Background Color
                elevation: MaterialStateProperty.all(0), //Defines Elevation
                shadowColor:
                    MaterialStateProperty.all(brown), //Defines shadowColor
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
                        imageUrl: "assets/images/anne.jpeg",
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
                              MyInfo(),
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
                              firstText: "13",
                              secondText: "Video call",
                              icon: Icon(
                                Icons.star,
                                size: 32,
                                color: Colors.blue,
                              ),
                            ),
                            ),
                            ProfileInfoBigCard(
                              firstText: "21",
                              secondText: "second page",
                              icon: Image.asset(
                                "assets/icons/sad_smiley.png",
                                width: 32.0,
                                color: Colors.blue,
                              ),
                            ),
                            
                          ],
                        ),
                        TableRow(
                          children: [
                            GestureDetector(
                              onTap: () => _showSettingsPanel(),
                              child: ProfileInfoBigCard(
                                firstText: "21",
                                secondText: "6 page",
                                icon: Image.asset(
                                  "assets/icons/sad_smiley.png",
                                  width: 32.0,
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
                                firstText: "21",
                                secondText: "6 page",
                                icon: Image.asset(
                                  "assets/icons/sad_smiley.png",
                                  width: 32.0,
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
                          firstText: "54%", secondText: "      Setting      "),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProfileInfoCard(
                      hasImage: true,
                      imagePath: "assets/icons/pulse.png",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ProfileInfoCard(firstText: "152", secondText: "Level"),
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
