import 'package:flutter/material.dart';

class MusicWrk extends StatefulWidget {
  String? music;
  MusicWrk({super.key, this.music});

  @override
  State<MusicWrk> createState() => _MusicWrkState();
}

class _MusicWrkState extends State<MusicWrk> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: screenWidth * .5,
          height: screenHeight * .09,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.orange,
              borderRadius: BorderRadius.circular(25)),
          child: Column(children: [
            Text(
              'WorkOut Music ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Text(widget.music ?? " ",
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(color: Colors.white)),
          ])),
    );
  }
}
