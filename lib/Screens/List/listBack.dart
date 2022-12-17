import 'package:flutter/material.dart';
import 'package:project/Screens/List/Detail/LegRaises.dart';
import 'package:project/Screens/List/Detail/catCowPose.dart';
import 'package:project/Screens/List/Detail/crunches.dart';
import 'package:project/Screens/List/Detail/pullUp.dart';

class ListBack extends StatelessWidget {
  const ListBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BACK'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        foregroundColor: Color.fromARGB(255, 112, 112, 112),
      ),
      backgroundColor: Colors.amber,
      body: ListView(
        children: [
          _buildList('Cat Cow Pose', 'assets/gifs/ezgif.com-gif-maker(1).gif',
              '20s', (context) => CatCowPose(), context),
          _buildList('Crunches', 'assets/gifs/ezgif.com-gif-maker(9).gif',
              '20s', (context) => Crunches(), context),
          _buildList('Leg Raises', 'assets/gifs/ezgif.com-gif-maker(15).gif',
              '20s', (context) => LegRaises(), context),
        ],
      ),
    );
  }
}

Widget _buildList(String listName, String imgPath, String time,
    Widget Function(BuildContext) listObject, context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: listObject));
      },
      //
      child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width - 60.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(width: 40),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        listName,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(time)
                    ],
                  ),
                ),
              ],
            ),
          )),
    ),
  );
}
