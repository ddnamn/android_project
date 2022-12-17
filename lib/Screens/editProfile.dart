import 'dart:io';
import 'package:project/Models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:project/Constants/Constants.dart';
import 'package:project/Constants/app_constants.dart';
import 'package:project/Models/userModel.dart';
import 'package:project/Services/database.dart';
import 'package:project/Screens/home.dart';

class EditProfile extends StatefulWidget {
  final UserModel user;

  const EditProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String _name;
  late String _umur;
  late String _quotes;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  saveProfile() async {
    _formKey.currentState!.save();

    if (_formKey.currentState!.validate() && !_isLoading) {
      setState(() {
        _isLoading = true;
      });
      UserModel user = UserModel(
          id: widget.user.id,
          name: _name,
          email: '',
          umur: _umur,
          quotes: _quotes);

      Database.updateUserData(user);
      Navigator.pop(context);
      // return Home();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _name = widget.user.name;
    _umur = widget.user.umur;
    _quotes = widget.user.quotes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainHexColor,
        foregroundColor: accentHexColor,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: mainHexColor,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FORM
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // === ICON ================
                    Icon(
                      Icons.person_outline_rounded, //person_pin_circle_outlined
                      size: 120,
                      color: accentHexColor,
                    ),
                    SizedBox(
                        // height: 30,
                        ),
                    // === TEXT ================
                    Text(
                      " Fill Form Below Completely \nto Update Profile !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: accentHexColor,
                        fontSize: 20,
                        height: 1.35,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    // ========== NAME FIELD ============
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: accentHexColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: accentHexColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: _name, // GET DATA FRROM FIRESTORE
                          hintStyle: TextStyle(color: accentHexColor),
                          fillColor: mainHexColor,
                          filled: true,
                        ),
                        validator: (input) => input!.trim().length < 2
                            ? 'The nick name should have at least 2 letters'
                            : null,
                        onSaved: (value) {
                          _name = value!;
                        },
                        style: TextStyle(color: accentHexColor),
                      ),
                    ),
                    SizedBox(
                      height: 30, //
                    ),
                    // ========== UMUR FIELD ============
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: accentHexColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: accentHexColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: _umur, // GET DATA FRROM FIRESTORE
                          hintStyle: TextStyle(color: accentHexColor),
                          fillColor: mainHexColor,
                          filled: true,
                        ),
                        // validator: (input) => input!.trim().length < 1
                        //     ? 'Please Enter Age'
                        //     : null,
                        onSaved: (value) {
                          _umur = value!;
                        },
                        style: TextStyle(color: accentHexColor),
                      ),
                    ),
                    SizedBox(
                      height: 30, //
                    ),
                    // === QUOTES BOX ============
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: accentHexColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: accentHexColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: _quotes, // GET DATA FRROM FIRESTORE
                          hintStyle: TextStyle(color: accentHexColor),
                          fillColor: mainHexColor,
                          filled: true,
                        ),
                        // validator: (input) => input!.trim().length < 1
                        //     ? 'Please Enter Quotes'
                        //     : null,
                        onSaved: (value) {
                          _quotes = value!;
                        },
                        style: TextStyle(color: accentHexColor),
                      ),
                    ),
                    SizedBox(
                      height: 50, //
                    ),
                    // LOGOUT ===================
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        onPressed: saveProfile,
                        color: mainHexColor,
                        child: Icon(
                          Icons.check_circle_outline_rounded,
                          color: accentHexColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 80, //
              // ),
              // // LOGOUT BUTTON
              // Padding(padding: padding)
            ],
          ),
        ),
      )),
    );
  }
}
