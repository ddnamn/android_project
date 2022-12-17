import 'package:flutter/material.dart';
import 'package:project/Screens/List/Detail/butBridge.dart';
import 'package:project/Screens/List/Detail/legRaises.dart';
import 'package:project/Screens/List/Detail/crunches.dart';
import 'package:project/Screens/List/Detail/legTouch.dart';
import 'package:project/Screens/List/Detail/walkingFloor.dart';

class ListAbs extends StatelessWidget {
  const ListAbs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABS'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        foregroundColor: Color.fromARGB(255, 112, 112, 112),
      ),
      backgroundColor: Colors.amber,
      body: ListView(
        children: [
          _buildList('Leg Touch', 'assets/gifs/ezgif.com-gif-maker(17).gif',
              '30s', (context) => LegTouch(), context),
          _buildList('But Bridge', 'assets/gifs/ezgif.com-gif-maker(14).gif',
              '20s', (context) => ButBridge(), context),
          _buildList('Crunches', 'assets/gifs/ezgif.com-gif-maker(9).gif',
              '20s', (context) => Crunches(), context),
          _buildList('Leg Raises', 'assets/gifs/ezgif.com-gif-maker(15).gif',
              '20s', (context) => LegRaises(), context),
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
