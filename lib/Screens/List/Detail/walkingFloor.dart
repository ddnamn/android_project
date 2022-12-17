import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

// ABS & LEG
class WalkingFloor extends StatelessWidget {
  final CountDownController controller = new CountDownController();
  @override
  Widget build(BuildContext context) {
// ===========================================

    Widget timer = Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NeonCircularTimer(
            onComplete: () {
              controller.restart();
            },
            width: 150,
            controller: controller,
            duration: 20,
            strokeWidth: 10,
            isTimerTextShown: true,
            neumorphicEffect: true,
            outerStrokeColor: Colors.grey.shade100,
            innerFillGradient: LinearGradient(
                colors: [Colors.orange.shade200, Colors.orange.shade400]),
            neonGradient: LinearGradient(
                colors: [Colors.orange.shade200, Colors.orange.shade400]),
            strokeCap: StrokeCap.round,
            innerFillColor: Colors.black12,
            backgroudColor: Colors.grey.shade100,
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: Icon(Icons.play_arrow),
                      onPressed: () {
                        controller.resume();
                      }),
                  IconButton(
                      icon: Icon(Icons.pause),
                      onPressed: () {
                        controller.pause();
                      }),
                  IconButton(
                      icon: Icon(Icons.repeat),
                      onPressed: () {
                        controller.restart();
                      }),
                ]),
          )
        ],
      ),
    );

    // =======================
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('WALKING FLOOR'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.amberAccent,
          foregroundColor: Color.fromARGB(255, 112, 112, 112),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Image.asset('assets/gifs/ezgif.com-gif-maker(18).gif',
                width: 200, height: 200),
            timer
          ],
        ));
  }
}
