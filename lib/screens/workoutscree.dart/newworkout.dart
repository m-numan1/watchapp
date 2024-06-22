import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/screens/workoutscree.dart/homewrkout.dart';

class NewWorkOut extends StatefulWidget {
  String day;
  NewWorkOut({super.key, required this.day});

  @override
  State<NewWorkOut> createState() => _NewWorkOutState();
}

class _NewWorkOutState extends State<NewWorkOut> {
  TextEditingController value = TextEditingController(text: '0');
  TextEditingController worktime = TextEditingController(text: '0');
  TextEditingController resttim = TextEditingController(text: '0');
  TextEditingController wrkmnlsong = TextEditingController();
  TextEditingController restmsic = TextEditingController();

  int? set = 0;
  void sets() {
    setState(() {});
    set = int.tryParse(value.text);
  }

  String songs = '00';
  String music1 =
      "https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3";
  String music2 =
      "https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3";
  String music3 =
      "https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3";

  List lis = [];
  String song = '...';
  String restmusic = '';
  CollectionReference users = FirebaseFirestore.instance.collection('User');
  final email = FirebaseAuth.instance.currentUser;
  Future<void> add(
      String music, String restMusic, int sets, int time, int resttime) async {
    Map<String, dynamic> data = {
      'workMusic': music,
      'restMusic': restMusic,
      'sets': sets,
      'worktime': time,
      'resttime': resttime,
    };
    await users.doc(email!.email).collection(widget.day).add(data).then(
          (value) => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomeWorkOut())),
        ); //add(data);
  }

  @override
  void initState() {
    super.initState();

    lis = [music1, music2, music3];
  }

  @override
  void dispose() {
    super.dispose();
    value.dispose();
    worktime.dispose();
    restmsic.dispose();
    resttim.dispose();
    wrkmnlsong.dispose();
  }

  
  void setMusicmanually() {
    setState(() {
      song = wrkmnlsong.text;
    });
  }

  void setRMusicmanually() {
    setState(() {
      restmusic = restmsic.text;
    });
  }

  int time = 00;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/gym.jpeg'), fit: BoxFit.fill)),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * .09,
                right: screenWidth * .09,
                bottom: screenHeight * .03,
                top: screenHeight * .07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
            padding: EdgeInsets.only(bottom: screenHeight * .04),
            child: Container(
              height: screenHeight * .06,
              width: screenWidth * .3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.blue),
              child: Center(
                  child: Text(
                'New Timer',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),

          // Workouttime(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.orange,
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
                                        controller: worktime,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            screenHeight * .05), // Add spacing
                                    ElevatedButton(
                                      onPressed: () {
                                        sets();
                                        Navigator.pop(context);
                                      },
                                      child: Text('Set'),
                                    )
                                  ]),
                            )),
                      );
                    });
              },
              child: Container(
                  width: screenWidth * .5,
                  height: screenHeight * .09,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(children: [
                    Text('Work out Time',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: screenHeight * .01,
                    ),
                    Text(
                      "00:" + worktime.text,
                      style: TextStyle(color: Colors.white),
                    ),
                  ])),
            ),
          ),
          // Resttime(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.orange,
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
                                        controller: resttim,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            screenHeight * .05), // Add spacing
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
              child: Container(
                  width: screenWidth * .5,
                  height: screenHeight * .09,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(children: [
                    Text('Rest Time', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: screenHeight * .01,
                    ),
                    Text(
                      "00:" + resttim.text,
                      style: TextStyle(color: Colors.white),
                    )
                  ])),
            ),
          ),
          // Sets(),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .020),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor:
                            Colors.orange, // Set background color for dialog
                        content: Container(
                            color: Colors.orange,
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
                                        height:
                                            screenHeight * .05), // Add spacing
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
              child: Container(
                  width: screenWidth * .5,
                  height: screenHeight * .09,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(children: [
                    Text('Sets', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      height: screenHeight * .01,
                    ),
                    Text(
                      value.text,
                      style: TextStyle(color: Colors.white),
                    )
                  ])),
            ),
          ),
          // Musicwrk(),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .03),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor:
                            Colors.orange, // Set background color for dialog
                        content: Container(
                            width: screenWidth * 0.8, // Responsive width
                            height: screenHeight * 0.7,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Select Music by clicking',
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
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.orange,
                                              // backgroundColor: Colors
                                              //     .grey[900], // Set background color for dialog
                                              content: Container(
                                                  width: screenWidth *
                                                      0.4, // Responsive width
                                                  height: screenHeight * 0.2,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width: screenWidth *
                                                                .4,
                                                            child: TextField(
                                                              decoration: InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide())),
                                                              controller:
                                                                  wrkmnlsong,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: screenHeight *
                                                                  .05), // Add spacing
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              setMusicmanually();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text('Set'),
                                                          )
                                                        ]),
                                                  )),
                                            );
                                          });
                                    },
                                    child: Text('Chose manually'),
                                  )
                                ])),
                      );
                    });
              },
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
                      height: screenHeight * .01,
                    ),
                    Center(
                      child: Text(
                        song,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ])),
            ),
          ),
          // Musicwrk2(),
          Padding(
            padding: EdgeInsets.only(top: screenHeight * .03),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor:
                            Colors.orange, // Set background color for dialog
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
                                              songs = lis[index];
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
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.orange,
                                              // backgroundColor: Colors
                                              //     .grey[900], // Set background color for dialog
                                              content: Container(
                                                  width: screenWidth *
                                                      0.4, // Responsive width
                                                  height: screenHeight * 0.2,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width: screenWidth *
                                                                .4,
                                                            child: TextField(
                                                              decoration: InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder()),
                                                              controller:
                                                                  restmsic,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: screenHeight *
                                                                  .05), // Add spacing
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              setRMusicmanually();
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text('Set'),
                                                          )
                                                        ]),
                                                  )),
                                            );
                                          });
                                    },
                                    child: Text('Chose Manually'),
                                  )
                                ])),
                      );
                    });
              },
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
                    SizedBox(
                      height: screenHeight * .01,
                    ),
                    Text(
                      maxLines: 1,
                      songs,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      style: TextStyle(color: Colors.white),
                    )
                  ])),
            ),
          ),
          SizedBox(
            height: screenHeight * .02,
          ),
          ElevatedButton(
              onPressed: () {
                add(
                  song,
                  songs,
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
