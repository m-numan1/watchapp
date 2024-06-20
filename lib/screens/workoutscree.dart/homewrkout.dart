import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:watch_app/screens/workoutscree.dart/newworkout.dart';
import 'package:watch_app/widgets/fetchwork.dart';

class HomeWorkOut extends StatefulWidget {
  const HomeWorkOut({super.key});

  @override
  State<HomeWorkOut> createState() => _HomeWorkOutState();
}

class _HomeWorkOutState extends State<HomeWorkOut> {
  int _selectedIndex = 0; // No container selected initially
  List<Map<String, dynamic>> dataList = [];
  Map<dynamic, dynamic> _data = {};
  CollectionReference users = FirebaseFirestore.instance.collection('User');

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  Future<void> fetchdata() async {
    try {
      QuerySnapshot snapshot = await users
          .doc('days')
          .collection((_selectedIndex + 1).toString())
          .get();

      //_data = snapshot.data() as Map<dynamic, dynamic>;
      if (snapshot.docs.isNotEmpty) {
        setState(() {
          dataList = snapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();
        });
      }

      print(_data);
    } catch (e) {
      print('Error fetching document: $e');
      // Handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    //fetchdata();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/gym.jpeg',
              ),
              opacity: 0.4)),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * .08,
                right: screenHeight * .03,
                top: screenHeight * .06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/images/gym.jpeg'),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * .08, vertical: screenHeight * .06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'New WorkOut',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewWorkOut(
                                    day: (_selectedIndex + 1).toString(),
                                  )));
                        },
                        icon: const Icon(
                          size: 30,
                          Icons.add_circle_outline_sharp,
                          color: Colors.orange,
                        )),
                    IconButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => const WorkPage()));
                        },
                        icon: const Icon(
                          size: 30,
                          Icons.save,
                          color: Colors.orange,
                        )),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .08),
            child: SizedBox(
              width: screenWidth,
              height: screenHeight * .15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                padding: EdgeInsets.only(left: screenWidth * .008),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * .04,
                          right: screenWidth * .02,
                          bottom: screenHeight * .04),
                      child: Container(
                        width: screenWidth * .1,
                        height: screenHeight * .01,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: _selectedIndex == index
                                    ? Colors.orange
                                    : Colors.grey,
                                width: 5)),
                        child: Text(
                          '0${index + 1}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          //   StreamBuilder<QuerySnapshot>(
          //     stream: FirebaseFirestore.instance
          //         .collection('users')
          //         .doc('days')
          //         .collection((_selectedIndex + 1).toString())
          //         .snapshots(),
          //     builder: (BuildContext context,
          //         AsyncSnapshot<QuerySnapshot> snapshot) {
          //       if (snapshot.connectionState ==
          //           ConnectionState.waiting) {
          //         return Center(child: CircularProgressIndicator());
          //       }
          //       if (snapshot.hasData) {
          //         List<Map<String, dynamic>> data;
          //         dataList = snapshot.data!.docs
          //             .map(
          //                 (doc) => doc.data() as Map<String, dynamic>)
          //             .toList();
          //         // dataList = snapshot.data!.docs
          //         //     .map(
          //         //         (doc) => doc.data() as Map<String, dynamic>)
          //         //     .toList();
          //         print("${dataList} list");
          //         print('if');
          //         return Padding(
          //           padding: EdgeInsets.only(top: screenHeight * .06),
          //           child: ListView.builder(
          //             shrinkWrap: true,
          //             itemCount: snapshot.data!.docs.length,
          //             itemBuilder: (context, index) {
          //               //var data = snapshot.data?.docs;

          //               return FetchWork(
          //                 set: dataList[index]['sets'].toString(),
          //                 worktime: dataList[index]['worktime'],
          //                 resttime: dataList[index]['resttime'],
          //                 restmusic: dataList[index]['restMusic'],
          //                 wrkmusic: dataList[index]['workMusic'],
          //               );
          //             },
          //           ),
          //         );
          //       }
          //       if (snapshot.hasError) {
          //         return Center(
          //             child: Text('Error: ${snapshot.error}'));
          //       }
          //       if (!snapshot.hasData ||
          //           snapshot.data!.docs.isEmpty) {
          //         return Center(child: Text('No data available'));
          //       }

          //       return Text('Nothing');
          //     },
          //   ),
          // ])

          dataList.isEmpty
              ? Center(
                  child: Text(
                    "No workout for this day",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : SizedBox(
                  height: screenHeight * .7,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * .03),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        //print(dataList);
                        return FetchWork(
                          set: dataList[index]['sets'].toString(),
                          worktime: dataList[index]['worktime'],
                          resttime: dataList[index]['resttime'],
                          restmusic: dataList[index]['restMusic'],
                          wrkmusic: dataList[index]['workMusic'],
                        );
                      },
                    ),
                  ),
                )
        ]),
      ),
    ));
  }
}

// import 'package:flutter/material.dart';

// class ContainerGrid extends StatefulWidget {
//   @override
//   _ContainerGridState createState() => _ContainerGridState();
// }

// class _ContainerGridState extends State<ContainerGrid> {
//   int _selectedIndex = 0; // No container selected initially

//   final List<List<String>> _data = [
//     ['Work time', '00:30', 'total sets', '10'],
//     ['Work time', '00:30', 'total sets ', '4'],
//     ['Work time', '00:30', 'total sets', '6'],
//     ['Work time', '00:30', 'total sets', '5'],
//     ['Work time', '00:30', 'total sets', '7'],
//     ['Work time', '00:30', 'total sets', '7']
//   ];

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: Column(
//         children: [
          // Grid of containers
//           Expanded(
//             flex: 1,
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 5, // 3 columns
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 childAspectRatio: 2,
//               ),
//               itemCount: 5,
//               padding: EdgeInsets.all(10),
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedIndex = index;
//                     });
//                   },
//                   child: Container(
//                     width: 15,
//                     height: 25,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                             color: _selectedIndex == index
//                                 ? Colors.orange
//                                 : Colors.grey,
//                             width: 2)),
//                     child: Text(
//                       '0${index + 1}',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Display data for the selected container
//           // Expanded(
//           //   flex: 1,
//           //   child: Center(
//           //     child: Text(
//           //       _selectedIndex == -1 ? ' ' : _data[_selectedIndex],
//           //       style: TextStyle(
//           //           fontSize: 18,
//           //           fontWeight: FontWeight.bold,
//           //           color: Colors.white),
//           //     ),
//           //   ),
//           // ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 60.0),
//             child: Container(
//               width: double.infinity,
//               height: 70,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: Colors.orange, width: 6)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         _data[_selectedIndex][0],
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           _data[_selectedIndex][1],
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       )
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         _data[_selectedIndex][2],
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           _data[_selectedIndex][3],
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       )
//                     ],
//                   ),
//                   IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.play_arrow_outlined,
//                         color: Colors.orange,
//                       ))
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
