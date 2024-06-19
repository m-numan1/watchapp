import 'package:flutter/material.dart';

class Musicwrk2 extends StatefulWidget {
  const Musicwrk2({super.key});

  @override
  State<Musicwrk2> createState() => _Musicwrk2State();
}

class _Musicwrk2State extends State<Musicwrk2> {
  List lis = ["www.music/play", "www.music/play", "www.music/play"];
  String song = '...';
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
            Text('Work Music PlayList', style: TextStyle(color: Colors.white)),
            SizedBox(
              height: 6,
            ),
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors
                              .grey[900], // Set background color for dialog
                          content: Container(
                              width: screenWidth * 0.8, // Responsive width
                              height: screenHeight * 0.7,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Select Music',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    SizedBox(height: 10), // Add spacing{}
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: lis.length,
                                        itemBuilder: (context, index) => Card(
                                          child: ListTile(
                                            onTap: () {
                                              setState(() {
                                                song = lis[index];
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            title: Text(lis[index]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10), // Add spacing
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Set'),
                                    )
                                  ])),
                        );
                      });
                },
                child: Text(
                  song,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white),
                ))
          ])),
    );
  }
}
