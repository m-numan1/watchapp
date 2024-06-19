import 'package:flutter/material.dart';

class Sets extends StatefulWidget {
  const Sets({super.key});

  @override
  State<Sets> createState() => _SetsState();
}

class _SetsState extends State<Sets> {
  TextEditingController value = TextEditingController();
  int? set = 0;
  void sets() {
    setState(() {});
    set = int.tryParse(value.text);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: screenWidth * .5,
          height: screenHeight * .095,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.orange,
              borderRadius: BorderRadius.circular(25)),
          child: Column(children: [
            Text('Sets', style: TextStyle(color: Colors.white)),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          // backgroundColor: Colors
                          //     .grey[900], // Set background color for dialog
                          content: Container(
                              width: screenWidth * 0.4, // Responsive width
                              height: screenHeight * 0.2,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: screenWidth * .4,
                                        child: TextField(
                                          decoration: InputDecoration(
                                              enabledBorder:
                                                  OutlineInputBorder()),
                                          controller: value,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      SizedBox(
                                          height: screenHeight *
                                              .05), // Add spacing
                                      ElevatedButton(
                                        onPressed: () {
                                          sets();
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Set'),
                                      )
                                    ]),
                              )),
                        );
                      });
                },
                child: Text(
                  set.toString(),
                  style: TextStyle(color: Colors.white),
                ))
          ])),
    );
  }
}
