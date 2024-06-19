import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

class Workouttime extends StatefulWidget {
  const Workouttime({super.key});

  @override
  State<Workouttime> createState() => _WorkouttimeState();
}

Duration _duration = Duration();

class _WorkouttimeState extends State<Workouttime> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: screenWidth * .5,
          height: screenHeight * .08,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.orange,
              borderRadius: BorderRadius.circular(25)),
          child: Column(children: [
            Text('Work out Time', style: TextStyle(color: Colors.white)),
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
                                    Text('Select Duration',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    SizedBox(height: 10), // Add spacing
                                    DurationPicker(
                                      onChange: (value) {
                                        setState(() {
                                          _duration = value;
                                        });
                                      },
                                      duration: _duration,
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
                  _duration.toString().split('.').first.padLeft(8, "0"),
                  style: TextStyle(color: Colors.white),
                ))
          ])),
    );
  }
}
