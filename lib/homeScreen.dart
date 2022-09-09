import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<int, List<int>>> bricks = getDefaultBricks();

  List<int> currentBrick = [];
  Timer? _timer;
  List<int> ocupiedPos = [];

  int pos = 0, randInt = 0;

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
                        changeBrickValue('left');

                        currentBrick.clear();
                        currentBrick.addAll(bricks[randInt][pos]!);
                      }
                    },
                    child: const Text('Left')),
                ElevatedButton(
                    onPressed: () {
                      String leftBrick = currentBrick[3].toString();
                      if (leftBrick.substring(
                              leftBrick.length - 1, leftBrick.length) !=
                          "0") {
                        changeBrickValue('right');

                        currentBrick.clear();
                        currentBrick.addAll(bricks[randInt][pos]!);
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
    randInt = Random().nextInt(4);
    pos = 0;
    bricks.clear();
    bricks = getDefaultBricks();
    currentBrick.addAll(getDefaultBricks()[randInt][pos]!);
    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (Timer timer) {
        checkClearRow();
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
            if (currentBrick[0] > 190 ||
                currentBrick[1] > 190 ||
                currentBrick[2] > 190 ||
                currentBrick[3] > 190) {
              hasReachFloor = true;
              return;
            }
            if (ocupiedPos.contains(currentBrick[0] + 10) ||
                ocupiedPos.contains(currentBrick[1] + 10) ||
                ocupiedPos.contains(currentBrick[2] + 10) ||
                ocupiedPos.contains(currentBrick[3] + 10)) {
              canGo = false;
              return;
            }
            changeBrickValue('down');
            currentBrick.clear();
            currentBrick.addAll(bricks[randInt][pos]!);
            print("");
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

  startAgain() {
    Navigator.pop(context);
    ocupiedPos.clear();
    startGame();
  }

  quit() {
    Navigator.pop(context);
    ocupiedPos.clear();
    currentBrick.clear();
    setState(() {});
  }

  rotate() {
    if (pos < 3) {
      pos++;
    } else {
      pos = 0;
    }
  }

  static getDefaultBricks() {
    return [
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
        2: [4, 5, 6, 16],
        3: [6, 16, 26, 25],
      },
      {
        0: [14, 15, 16, 6],
        1: [5, 15, 25, 26],
        2: [5, 15, 6, 7],
        3: [5, 6, 16, 26],
      },
    ];
  }

  changeBrickValue(String type) {
    bricks[randInt][0]![0] = type == 'down'
        ? (bricks[randInt][0]![0] + 10)
        : type == 'left'
            ? (bricks[randInt][0]![0] - 1)
            : (bricks[randInt][0]![0] + 1);
    bricks[randInt][0]![1] = type == 'down'
        ? (bricks[randInt][0]![1] + 10)
        : type == 'left'
            ? (bricks[randInt][0]![1] - 1)
            : (bricks[randInt][0]![1] + 1);
    bricks[randInt][0]![2] = type == 'down'
        ? (bricks[randInt][0]![2] + 10)
        : type == 'left'
            ? (bricks[randInt][0]![2] - 1)
            : (bricks[randInt][0]![2] + 1);
    bricks[randInt][0]![3] = type == 'down'
        ? (bricks[randInt][0]![3] + 10)
        : type == 'left'
            ? (bricks[randInt][0]![3] - 1)
            : (bricks[randInt][0]![3] + 1);

    bricks[randInt][1]![0] = type == 'down'
        ? (bricks[randInt][1]![0] + 10)
        : type == 'left'
            ? (bricks[randInt][1]![0] - 1)
            : (bricks[randInt][1]![0] + 1);
    bricks[randInt][1]![1] = type == 'down'
        ? (bricks[randInt][1]![1] + 10)
        : type == 'left'
            ? (bricks[randInt][1]![1] - 1)
            : (bricks[randInt][1]![1] + 1);
    bricks[randInt][1]![2] = type == 'down'
        ? (bricks[randInt][1]![2] + 10)
        : type == 'left'
            ? (bricks[randInt][1]![2] - 1)
            : (bricks[randInt][1]![2] + 1);
    bricks[randInt][1]![3] = type == 'down'
        ? (bricks[randInt][1]![3] + 10)
        : type == 'left'
            ? (bricks[randInt][1]![3] - 1)
            : (bricks[randInt][1]![3] + 1);

    bricks[randInt][2]![0] = type == 'down'
        ? (bricks[randInt][2]![0] + 10)
        : type == 'left'
            ? (bricks[randInt][2]![0] - 1)
            : (bricks[randInt][2]![0] + 1);
    bricks[randInt][2]![1] = type == 'down'
        ? (bricks[randInt][2]![1] + 10)
        : type == 'left'
            ? (bricks[randInt][2]![1] - 1)
            : (bricks[randInt][2]![1] + 1);
    bricks[randInt][2]![2] = type == 'down'
        ? (bricks[randInt][2]![2] + 10)
        : type == 'left'
            ? (bricks[randInt][2]![2] - 1)
            : (bricks[randInt][2]![2] + 1);
    bricks[randInt][2]![3] = type == 'down'
        ? (bricks[randInt][2]![3] + 10)
        : type == 'left'
            ? (bricks[randInt][2]![3] - 1)
            : (bricks[randInt][2]![3] + 1);

    bricks[randInt][3]![0] = type == 'down'
        ? (bricks[randInt][3]![0] + 10)
        : type == 'left'
            ? (bricks[randInt][3]![0] - 1)
            : (bricks[randInt][3]![0] + 1);
    bricks[randInt][3]![1] = type == 'down'
        ? (bricks[randInt][3]![1] + 10)
        : type == 'left'
            ? (bricks[randInt][3]![1] - 1)
            : (bricks[randInt][3]![1] + 1);
    bricks[randInt][3]![2] = type == 'down'
        ? (bricks[randInt][3]![2] + 10)
        : type == 'left'
            ? (bricks[randInt][3]![2] - 1)
            : (bricks[randInt][3]![2] + 1);
    bricks[randInt][3]![3] = type == 'down'
        ? (bricks[randInt][3]![3] + 10)
        : type == 'left'
            ? (bricks[randInt][3]![3] - 1)
            : (bricks[randInt][3]![3] + 1);
  }

  checkClearRow() {
    ocupiedPos.sort();
    for (int i = 1; i <= 20; i++) {
      if (checkRow((i * 10) - 9, i * 10)) {
        ocupiedPos.removeRange(ocupiedPos.indexOf((i * 10) - 9), ocupiedPos.indexOf(i * 10));
        print('true');
      }
    }
    print("");
  }

  checkRow(int a, int b) {
    List<bool> rowOccupied = [];
    rowOccupied.clear();
    for (int i = a; i < b; i++) {
      rowOccupied.add(ocupiedPos.contains(i));
    }
    return !rowOccupied.contains(false);
  }
}
