import 'package:flutter/material.dart';
import 'package:project/Screens/List/Detail/Crunches.dart';
import 'package:project/Screens/List/Detail/LegRaises.dart';
import 'package:project/Screens/List/Detail/gluteKick.dart';
import 'package:project/Screens/List/Detail/legTouch.dart';
import 'package:project/Screens/List/Detail/pullUp.dart';
import 'package:project/Screens/List/Detail/squats.dart';
import 'package:project/Screens/List/Detail/walkingFloor.dart';

class ListLeg extends StatelessWidget {
  const ListLeg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LEG'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        foregroundColor: Color.fromARGB(255, 112, 112, 112),
      ),
      backgroundColor: Colors.amber,
      body: ListView(
        children: [
          _buildList('Crunches', 'assets/gifs/ezgif.com-gif-maker(9).gif',
              '20s', (context) => Crunches(), context),
          _buildList('Glute Kick', 'assets/gifs/ezgif.com-gif-maker(4).gif',
              '20s', (context) => GluteKick(), context),
          _buildList('Leg Raises', 'assets/gifs/ezgif.com-gif-maker(15).gif',
              '20s', (context) => LegRaises(), context),
          _buildList('Leg Touch', 'assets/gifs/ezgif.com-gif-maker(17).gif',
              '30s', (context) => LegTouch(), context),
          _buildList('Squats', 'assets/gifs/ezgif.com-gif-maker(13).gif', '20s',
              (context) => Squats(), context),
          _buildList('Walking Floor', 'assets/gifs/ezgif.com-gif-maker(18).gif',
              '20s', (context) => WalkingFloor(), context),
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
