import 'dart:async';
import 'package:flutter/material.dart';
import 'package:watch_app/screens/workoutscree.dart/rest.dart';
import 'package:watch_app/widgets/music.dart';
import 'package:watch_app/widgets/reps.dart';
import 'package:watch_app/widgets/workmusicplaylist.dart';
import 'package:audioplayers/audioplayers.dart';

class WorkPage extends StatefulWidget {
  String worktime, restime, wrkmusic, restmusic, set;
  WorkPage(
      {super.key,
      required this.set,
      required this.worktime,
      required this.wrkmusic,
      required this.restime,
      required this.restmusic});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  late int val;
  double newval = 1;
  int set = 0;
  double volume = 10;
  late Timer _timer;
  @override
  void initState() {
    super.initState();

    val = int.parse(widget.worktime);
  }

  void navigateToSecondScreenAfterDelay() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RestPage(
                  set: widget.set,
                  resttime: widget.restime,
                  restmusic: widget.restmusic,
                )));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  final player = AudioPlayer();

  void increment() async {
    await player.play(volume: 100, UrlSource(widget.wrkmusic));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timer = timer;
      setState(() {
        if (set == int.parse(widget.set)) {
          player.stop();
        }
        newval++;
        val--;
        if (val < 1) {
          _timer.cancel();
          navigateToSecondScreenAfterDelay();
          Future.delayed(Duration(seconds: 10)).then((_) {
            setState(() {
              newval = 0;
              if (set < int.parse(widget.set)) {
                set++;
                val = int.parse(widget.worktime);
              }
            });
          });
        }
        // Reset the value if it exceeds 100
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //increment();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/gym.jpeg'),
                  opacity: 0.3,
                  fit: BoxFit.fill)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * .04, vertical: screenHeight * .06),
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
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Work',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage: AssetImage('assets/images/image.png'),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * .06,
                right: (screenWidth - (newval * 20)).clamp(0, double.infinity),
              ),
              child: Image.asset('assets/images/vector.png'),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * .07),
                  child: Container(
                    width: double.infinity,
                    height: screenHeight * .09,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * .65),
                        child: Text(
                          "00:${val}",
                          style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: screenWidth * .3,
                    left: screenWidth * .07,
                  ),
                  child: Container(
                    width: newval * 10,
                    height: screenHeight * .095,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  // child: SliderTheme(
                  //   data: SliderTheme.of(context).copyWith(
                  //     thumbShape: const RoundSliderThumbShape(
                  //       enabledThumbRadius:
                  //           25.0, // Customize the thumb radius
                  //     ),
                  //     activeTrackColor: Colors.orange,
                  //     inactiveTrackColor: Colors.white.withOpacity(1),
                  //     trackHeight:
                  //         screenHeight * .09, // Customize the track height
                  //   ),
                  //   child: Slider(
                  //     thumbColor: Colors.orange,
                  //     value: val,
                  //     min: 0,
                  //     max: 30,
                  //     divisions: 100,
                  //     label: val.round().toString(),
                  //     onChanged: (values) {
                  //       setState(() {
                  //         val = values;
                  //       });
                  //     },
                  //   ),
                  // ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * .09),
              child: //Sets(),
                  Padding(
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
                          Text("${set.toString()}/${widget.set}",style: TextStyle(color: Colors.white)),
                        ]),
                      )),
            ),
            Music(
              music: widget.restmusic,
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * .04),
              child: Icon(
                size: 30,
                Icons.volume_up_outlined,
                color: Colors.orange,
              ),
            ),
            Slider(
                thumbColor: Colors.orange,
                activeColor: Colors.orange,
                max: 30,
                min: 0,
                value: volume,
                onChanged: (value) {
                  volume = value;
                }),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * .08,
                  right: screenWidth * .08,
                  top: screenHeight * .04,
                  bottom: screenHeight * .09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      increment();
                    },
                    child: Container(
                      height: screenHeight * .06,
                      width: screenWidth * .17,
                      decoration: BoxDecoration(
                        color: Colors.green[800],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text('Start'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await player.stop();
                      _timer.cancel();
                    },
                    child: Container(
                      height: screenHeight * .06,
                      width: screenWidth * .17,
                      decoration: BoxDecoration(
                        color: Colors.red[800],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text('Stop'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await player.resume();
                    },
                    child: Container(
                      height: screenHeight * .06,
                      width: screenWidth * .17,
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text('Resume'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}