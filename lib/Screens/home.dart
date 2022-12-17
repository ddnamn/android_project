import 'package:project/Screens/List/listAbs.dart';
import 'package:project/Screens/List/listBack.dart';
import 'package:project/Screens/List/listUpper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:project/Models/userModel.dart';
import 'package:project/Constants/app_constants.dart';
import 'package:project/Constants/constants.dart';

import 'package:project/Screens/List/listAbs.dart';
import 'package:project/Screens/List/listArms.dart';
import 'package:project/Screens/List/listChest.dart';
import 'package:project/Screens/List/listLeg.dart';
import 'package:project/Screens/List/listBack.dart';
import 'package:project/Screens/List/listUpper.dart';

class Home extends StatefulWidget {
  final currentUserID;
  final String visitedUserID;

  const Home(
      {Key? key, required this.currentUserID, required this.visitedUserID})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder(
        future: usersRef.doc(widget.currentUserID).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(accentHexColor),
              ),
            );
          }
          UserModel userModel = UserModel.fromDoc(snapshot.data);
          return Stack(
            children: <Widget>[
              // 1. Backround Header
              Container(
                // Here the height of the container is 45% of our total height
                height: size.height * .35, // ( <tinggi emulator> x 0.45 )
                decoration: BoxDecoration(
                  // color: Color(0xFFF5CEB8),
                  color: Color.fromARGB(200, 255, 210, 0), //rgb(255,202,40)
                  image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    image: const AssetImage(
                        "assets/images/undraw_pilates_gpdb.png"),
                  ),
                ),
              ),
              // 2. Content Home
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 13.0),
                          child: Text(
                            "Nice to see you,  \n" + userModel.name + '!',
                            style: TextStyle(
                              // color: Color.fromARGB(255, 40, 40, 40),
                              color: kTextColor,
                              fontSize: 39,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Cairo",
                              height: 1.0,
                            ),
                          ),
                        ),
                        // Text(
                        SizedBox(
                          height: 50,
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width - 40.0,
                          height: MediaQuery.of(context).size.height - 250.0,
                          child: GridView.count(
                            // crossAxisCount: 2, // jumlah kolom card
                            // primary: false,
                            // childAspectRatio: 0.8, // ukuran card
                            // crossAxisSpacing: 10.0, // space between card in vertikal
                            // mainAxisSpacing: 15.0, // space between card in horiz
                            crossAxisCount: 2, // jumlah kolom card
                            primary: false,
                            childAspectRatio: .90, // ukuran card
                            crossAxisSpacing:
                                20, // space between card in vertikal
                            mainAxisSpacing: 20, // space between card in horiz
                            children: <Widget>[
                              _buildCard('ABS', 'assets/images/abs.png',
                                  (context) => ListAbs(), context),
                              _buildCard('ARM', 'assets/images/arm.png',
                                  (context) => ListArms(), context),
                              _buildCard('BACK', 'assets/images/back.png',
                                  (context) => ListBack(), context),
                              _buildCard('CHEST', 'assets/images/chest.png',
                                  (context) => ListChest(), context),
                              _buildCard('LEG', 'assets/images/leg.png',
                                  (context) => ListLeg(), context),
                              _buildCard(
                                  'UPPER-BODY',
                                  'assets/images/upper-body.png',
                                  (context) => ListUpper(),
                                  context),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  // === [Builder Cards] ===
  Widget _buildCard(String listName, String imgPath,
      Widget Function(BuildContext) listObject, context) {
    return Padding(
      padding: EdgeInsets.all(0), // set margin card (luar card)
      child: InkWell(
        onTap: () {
          // print("START onTap");
          Navigator.of(context).push(MaterialPageRoute(builder: listObject));
          // print("END onTap");
        },
        child: Container(
          // DEKORASI CONTAINER
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0)
            ],
            color: Colors.white,
          ),
          // ISI CONTAINER
          child: Column(
            children: [
              // === [Penempatan gambar pd Container] ===
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Hero(
                  tag: imgPath,
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   width: 1,
                      //   color: Colors.red,
                      // ),
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6.0),
              // === [Judul Card] ===
              Text(
                listName,
                style: TextStyle(
                  // color: Color(0xFFCC8053),
                  // color: Color.fromARGB(255, 255, 202, 40), //255, 202, 40
                  color: Color.fromARGB(255, 116, 119, 116), //255, 202, 40
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Cairo',
                  fontSize: 29.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
