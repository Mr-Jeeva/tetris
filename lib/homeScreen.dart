import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<int, List<int>>> bricks = [
    {
      0: [5, 6, 15, 16],
      1: [5, 6, 15, 16],
      2: [5, 6, 15, 16],
      3: [5, 6, 15, 16],
    },
    {
      0: [4, 5, 6, 7],
      1: [6, 16, 26, 36],
      2: [4, 5, 6, 7],
      3: [6, 16, 26, 36],
    },
    {
      0: [5, 15, 16, 17],
      1: [5, 6, 15, 25],
      2: [6, 16, 15, 14],
      3: [25, 26, 15, 5],
    },
    {
      0: [14, 15, 16, 6],
      1: [4, 14, 24, 25],
      2: [14, 15, 16, 6],
      3: [14, 15, 16, 6],
    },
  ];
  List<int> currentBrick = [];
  Timer? _timer;
  List<int> ocupiedPos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10, childAspectRatio: 1.1),
                  itemCount: 200,
                  itemBuilder: (context, index) {
                    return Container(
                      color: () {
                        if (ocupiedPos.contains(index + 1) ||
                            currentBrick.contains(index + 1)) {
                          return Colors.red;
                        }
                        return Colors.black12;
                      }(),
                      margin: const EdgeInsets.all(1),
                      child: Center(
                        child: Text("${index + 1}"),
                      ),
                    );
                  })),
          Container(
            height: 60,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      startGame();
                    },
                    child: const Text('Start')),
                ElevatedButton(
                    onPressed: () {
                      String leftBrick = currentBrick[0].toString();
                      if (leftBrick.substring(
                              leftBrick.length - 1, leftBrick.length) !=
                          "1") {
                        for (int i = 0; i < currentBrick.length; i++) {
                          currentBrick[i] = currentBrick[i] - 1;
                        }
                      }
                    },
                    child: const Text('Left')),
                ElevatedButton(
                    onPressed: () {
                      String leftBrick = currentBrick[3].toString();
                      if (leftBrick.substring(
                              leftBrick.length - 1, leftBrick.length) !=
                          "0") {
                        for (int i = 0; i < currentBrick.length; i++) {
                          currentBrick[i] = currentBrick[i] + 1;
                        }
                      }
                    },
                    child: const Text('Right')),
                ElevatedButton(
                    onPressed: () {
                      rotate();
                    },
                    child: const Text('Rotate')),
                ElevatedButton(
                    onPressed: () {
                      quit();
                    },
                    child: const Text('Stop')),
              ],
            ),
          )
        ],
      )),
    );
  }

  startGame() {
    bool hasReachFloor = false, canGo = true;
    currentBrick.addAll(bricks[Random().nextInt(4)][0]!);
    _timer = Timer.periodic(
      const Duration(milliseconds: 300),
      (Timer timer) {
        if (isGameOver()) {
          _timer!.cancel();
          showDialog(
              context: context,
              builder: (c) {
                return AlertDialog(
                  title: const Text('Game Over'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          startAgain();
                        },
                        child: const Text('Start Again')),
                    ElevatedButton(
                        onPressed: () {
                          quit();
                        },
                        child: const Text('Quit'))
                  ],
                );
              });
        } else {
          if (hasReachFloor == false && canGo == true) {
            for (int i = 0; i < currentBrick.length; i++) {
              for (int element in currentBrick) {
                if (element > 190) {
                  hasReachFloor = true;
                  break;
                }
                if (ocupiedPos.contains(element + 10)) {
                  canGo = false;
                  break;
                }
              }
              currentBrick[i] = currentBrick[i] + 10;
            }
          } else {
            ocupiedPos.addAll(currentBrick);
            currentBrick.clear();
            timer.cancel();
            startGame();
          }
        }
        setState(() {});
      },
    );
  }

  bool isGameOver() {
    if (ocupiedPos.contains(11) ||
        ocupiedPos.contains(12) ||
        ocupiedPos.contains(13) ||
        ocupiedPos.contains(14) ||
        ocupiedPos.contains(15) ||
        ocupiedPos.contains(16) ||
        ocupiedPos.contains(17) ||
        ocupiedPos.contains(18) ||
        ocupiedPos.contains(19) ||
        ocupiedPos.contains(20)) {
      return true;
    }
    return false;
  }

  void startAgain() {
    Navigator.pop(context);
    ocupiedPos.clear();
    startGame();
  }

  void quit() {
    Navigator.pop(context);
    ocupiedPos.clear();
    currentBrick.clear();
    setState(() {});
  }

  void rotate() {
    currentBrick = [];
  }
}

class GridModel {
  bool occupied = false;
  Color color = Colors.black54;
  int? id;

  GridModel({required this.occupied, required this.color, required this.id});

  setColor(Color col) {
    this.color = col;
  }

  setOccupied(bool occ) {
    this.occupied = occ;
  }
}
