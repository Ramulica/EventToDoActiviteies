import 'package:flutter/material.dart';
import 'package:hallowenapp/models/globals.dart' as globals;
import 'package:hallowenapp/models/Challenge_.dart';
import 'package:hallowenapp/models/users.dart';

class ProfilePage1 extends StatefulWidget {
  const ProfilePage1({super.key});

  @override
  State<ProfilePage1> createState() => _ProfilePage1State();
}

class _ProfilePage1State extends State<ProfilePage1> {
  String nume = "andrei";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 2, child: _TopPortion()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: const Text("Login"),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        labelText: nume,
                                        icon: Icon(Icons.message),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                child: const Text("submit"),
                                onPressed: () {
                                  // your code
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      nume,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 10,
                            color: globals.AppColor().b1ackgroudnColorapp)),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            'SCOR',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            "${getScore()}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}

class ShowedPoints extends StatelessWidget {
  const ShowedPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProfileInfoItem {
  final String title;
  final int value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatefulWidget {
  const _TopPortion({super.key});

  @override
  State<_TopPortion> createState() => __TopPortionState();
}

class __TopPortionState extends State<_TopPortion> {
  String imgadress = "imgs/pinkHeatGhost.png";
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    globals.AppColor().barrColorapp,
                    globals.AppColor().b1ackgroudnColorapp
                  ]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(children: [
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width / 5 -
                                              4,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgadress = "imgs/angryBrain.png";
                                          });
                                        },
                                        child: Image(
                                          image:
                                              AssetImage("imgs/angryBrain.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width / 5 -
                                              4,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgadress = "imgs/cuteDeath.png";
                                          });
                                        },
                                        child: Image(
                                          image:
                                              AssetImage("imgs/cuteDeath.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width / 5 -
                                              4,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgadress = "imgs/deadCook.png";
                                          });
                                        },
                                        child: Image(
                                          image:
                                              AssetImage("imgs/deadCook.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width / 5 -
                                              4,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgadress =
                                                "imgs/orangeHatGhostpng.png";
                                          });
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              "imgs/orangeHatGhostpng.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width / 5 -
                                              4,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgadress =
                                                "imgs/pinkHeatGhost.png";
                                          });
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              "imgs/pinkHeatGhost.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width / 5 -
                                              4,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgadress = "imgs/pumpkinHead.png";
                                          });
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              "imgs/pumpkinHead.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width / 5 -
                                              4,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgadress = "imgs/skeletonBike.png";
                                          });
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              "imgs/skeletonBike.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width / 5 -
                                              4,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgadress = "imgs/SkeletonHead.png";
                                          });
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              "imgs/SkeletonHead.png"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width / 5 -
                                              4,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            imgadress =
                                                "imgs/skeletonLolopop.png";
                                          });
                                        },
                                        child: Image(
                                          image: AssetImage(
                                              "imgs/skeletonLolopop.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(imgadress),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
