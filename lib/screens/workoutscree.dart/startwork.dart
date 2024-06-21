import 'package:flutter/material.dart';
import 'package:watch_app/screens/workoutscree.dart/homewrkout.dart';
import 'package:watch_app/screens/workoutscree.dart/newworkout.dart';
import 'package:watch_app/screens/workoutscree.dart/work.dart';

class StartWork extends StatefulWidget {
  String wrkmusic, restmusic, set;
  int worktime, restime;
  StartWork(
      {super.key,
      required this.set,
      required this.wrkmusic,
      required this.restmusic,
      required this.worktime,
      required this.restime});

  @override
  State<StartWork> createState() => _StartWorkState();
}

class _StartWorkState extends State<StartWork> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        left: true,
        right: true,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/gym.jpeg'),
                  opacity: 0.3,
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .03,
                    vertical: screenHeight * .07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeWorkOut()));
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
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Save WorkOut',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage('assets/images/image.png'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * .28),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * .05),
                        child: Container(
                          height: screenHeight * .05,
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
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * .2, right: screenWidth * .03),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewWorkOut(
                                      day: (0 + 1).toString(),
                                    )));
                          },
                          icon: Icon(
                            Icons.add_circle_outline_outlined,
                            color: Colors.orange,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .08,
                    vertical: screenHeight * .08),
                child: SizedBox(
                  height: screenHeight * .4,
                  width: screenWidth,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth * .05,
                          right: screenWidth * .05,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: screenHeight * .11,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: Colors.orange, width: 6)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      "Workout Time",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      "00:" + widget.worktime.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 6.0),
                                    child: Text(
                                      "Rest time",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4.0),
                                    child: Text(
                                      "00:" + widget.restime.toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orange),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => WorkPage(
                                                set: widget.set,
                                                worktime:
                                                    widget.worktime.toString(),
                                                wrkmusic: widget.wrkmusic,
                                                restime: widget.restmusic,
                                                restmusic: widget.restmusic)),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.play_arrow_outlined,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * .08),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => WorkPage(
                              set: widget.set,
                              worktime: widget.worktime.toString(),
                              wrkmusic: widget.wrkmusic,
                              restime: widget.restmusic,
                              restmusic: widget.restmusic)),
                    );
                  },
                  child: Container(
                    height: screenHeight * .05,
                    width: screenWidth * .4,
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      'start',
                      style: TextStyle(color: Colors.orange),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
