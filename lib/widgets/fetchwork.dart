import 'package:flutter/material.dart';

import '../screens/workoutscree.dart/startwork.dart';

class FetchWork extends StatefulWidget {
  FetchWork({
    super.key,
    required this.set,
    required this.worktime,
    required this.resttime,
    required this.wrkmusic,
    required this.restmusic,
  });
  int worktime, resttime;
  String wrkmusic, restmusic,set;
  Function? funct;
  @override
  State<FetchWork> createState() => _FetchWorkState();
}

class _FetchWorkState extends State<FetchWork> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth * .09,
          right: screenWidth * .09,
          bottom: screenHeight * .09),
      child: Container(
        width: double.infinity,
        height: screenHeight * .12,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.orange, width: 9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Work Time',
                  style: const TextStyle(color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    widget.worktime.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "Rest Time",
                  style: const TextStyle(color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    widget.resttime.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            Container(
              height: screenHeight * .09,
              decoration: const BoxDecoration(
                  color: Colors.orange, shape: BoxShape.circle),
              child: Center(
                child: IconButton(
                    onPressed: () {
                  
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) =>  StartWork(set:widget.set,worktime: widget.worktime,wrkmusic: widget.wrkmusic,restime: widget.resttime,restmusic: widget.restmusic,)),
                      );
                    },
                    icon: const Icon(
                      Icons.play_arrow_outlined,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
