import 'package:project/Models/userModel.dart';
import 'package:project/Screens/editProfile.dart';
import 'package:project/Screens/authScreen.dart';
import 'package:flutter/material.dart';
import 'package:project/Constants/constants.dart';
import 'package:project/Constants/app_constants.dart';
import 'package:project/Services/auth.dart';

class Profile extends StatefulWidget {
  final String currentUserID;
  final String visitedUserID;

  const Profile(
      {Key? key, required this.currentUserID, required this.visitedUserID})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      body: FutureBuilder(
          future: usersRef.doc(widget.visitedUserID).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(accentHexColor),
                ),
              );
            }
            UserModel userModel = UserModel.fromDoc(snapshot.data);
            return SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // ==== ICON
                      Icon(
                        Icons
                            .person_outline_rounded, //person_pin_circle_outlined
                        size: 120,
                        color: accentHexColor,
                      ),
                      // ==== TEXT
                      Text(
                        "PROFILE",
                        style: TextStyle(
                          color: accentHexColor,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      // ==== NAME ====
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          height: 60,
                          width: 380,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: accentHexColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Text(
                              userModel.name,
                              style: TextStyle(
                                color: accentHexColor,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30, //
                      ),
                      // ==== UMUR ====
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          height: 60,
                          width: 380,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: accentHexColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Text(
                              userModel.umur,
                              style: TextStyle(
                                color: accentHexColor,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30, //
                      ),
                      // ==== QUOTES ====
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          height: 60,
                          width: 380,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: accentHexColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Text(
                              userModel.quotes,
                              style: TextStyle(
                                color: accentHexColor,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30, //
                      ),
                      // ==== EDIT BUTTON NAV ====
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EditProfile(user: userModel)));
                            setState(() {});
                          },
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 13.0),
                            decoration: BoxDecoration(
                              color: accentHexColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: Text(
                              'edit profile -> ',
                              style: TextStyle(
                                  color: mainHexColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80, //
                      ),
                      // ==== LOGOUT BUTTON ====
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          onPressed: (() {
                            AuthService.logout();
                            // return AuthScreen();
                          }),
                          color: mainHexColor,
                          child: Icon(
                            Icons.exit_to_app,
                            color: accentHexColor,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
