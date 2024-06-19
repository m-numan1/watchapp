import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  String? music;
  Music({super.key, this.music});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
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
              'Rest Music ',
              style: TextStyle(color: Colors.white),
            ),
            Text(widget.music ?? " ",
                maxLines: 1, style: TextStyle(color: Colors.white)),
          ])),
    );
  }
}
