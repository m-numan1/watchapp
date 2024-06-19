import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/screens/workoutscree.dart/homewrkout.dart';

class NewWorkOut extends StatefulWidget {
  String day;
  NewWorkOut({super.key, required this.day});

  @override
  State<NewWorkOut> createState() => _NewWorkOutState();
}

class _NewWorkOutState extends State<NewWorkOut> {
  TextEditingController value = TextEditingController();
  TextEditingController worktime = TextEditingController();
  TextEditingController resttim = TextEditingController();
  int? set = 0;
  void sets() {
    setState(() {});
    set = int.tryParse(value.text);
  }

  String music1 =
      "http://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3";
  String music2 =
      "http://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3";
  String music3 =
      "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3";

  List lis = [];
  String song = '...';
  String restmusic = '';
  CollectionReference users = FirebaseFirestore.instance.collection('User');

  Future<void> add(
      String music, String restMusic, int sets, int time, int resttime) async {
    Map<String, dynamic> data = {
      'workMusic': music,
      'restMusic': restMusic,
      'sets': sets,
      'worktime': time,
      'resttime': resttime,
    };
    await users.doc('days').collection(widget.day).add(data).then(
          (value) => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomeWorkOut())),
        ); //add(data);
  }

  @override
  void initState() {
    super.initState();

    lis = [music1, music2, music3];
  }

  int time = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/gym.jpeg'))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * .09, right: screenWidth * .09, bottom: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'New WorkOut',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/images/image.png'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: screenHeight * .06,
                width: screenWidth * .3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue),
                child: Center(
                    child: Text(
                  'New Timer',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),

          // Workouttime(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: screenWidth * .5,
                height: screenHeight * .08,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(children: [
                  Text('Work out Time', style: TextStyle(color: Colors.white)),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                // backgroundColor: Colors
                                //     .grey[900], // Set background color for dialog
                                content: Container(
                                    width:
                                        screenWidth * 0.4, // Responsive width
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
                                                controller: worktime,
                                                keyboardType:
                                                    TextInputType.number,
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
                        time.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: 6,
                  )
                ])),
          ),
          // Resttime(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: screenWidth * .5,
                height: screenHeight * .08,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(children: [
                  Text('Rest Time', style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 6,
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
                                    width:
                                        screenWidth * 0.4, // Responsive width
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
                                                controller: resttim,
                                                keyboardType:
                                                    TextInputType.number,
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
                        time.toString(),
                        style: TextStyle(color: Colors.white),
                      ))
                ])),
          ),
          // Sets(),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                                    width:
                                        screenWidth * 0.4, // Responsive width
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
                                                keyboardType:
                                                    TextInputType.number,
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
          ),
          // Musicwrk(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: screenWidth * .5,
                height: screenHeight * .09,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(children: [
                  Text('Work Music PlayList',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.grey[
                                    900], // Set background color for dialog
                                content: Container(
                                    width:
                                        screenWidth * 0.8, // Responsive width
                                    height: screenHeight * 0.7,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Select Music',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          SizedBox(height: 10), // Add spacing{}
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: lis.length,
                                              itemBuilder: (context, index) =>
                                                  Card(
                                                child: ListTile(
                                                  onTap: () {
                                                    setState(() {
                                                      song = lis[index];
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  title: Text(
                                                    lis[index],
                                                    overflow: TextOverflow.fade,
                                                  ),
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
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.white),
                      ))
                ])),
          ),
          // Musicwrk2(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                width: screenWidth * .5,
                height: screenHeight * .09,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(children: [
                  Text(
                    'Rest Music PlayList',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.grey[
                                    900], // Set background color for dialog
                                content: Container(
                                    width:
                                        screenWidth * 0.8, // Responsive width
                                    height: screenHeight * 0.7,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text('Select Music',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                          SizedBox(height: 10), // Add spacing{}
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: lis.length,
                                              itemBuilder: (context, index) =>
                                                  Card(
                                                child: ListTile(
                                                  onTap: () {
                                                    setState(() {
                                                      song = lis[index];
                                                      Navigator.of(context)
                                                          .pop();
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
                        maxLines: 1,
                        song,
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: Colors.white),
                      ))
                ])),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                add(
                  song,
                  song,
                  set!,
                  int.parse(worktime.text),
                  int.parse(resttim.text),
                );
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => const StartWork()));
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.orange),
              ))
        ]),
      ),
    ));
  }
}
