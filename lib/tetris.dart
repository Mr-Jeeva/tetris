import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Tetris extends StatefulWidget {
  const Tetris({Key? key}) : super(key: key);

  @override
  State<Tetris> createState() => _TetrisState();
}

class _TetrisState extends State<Tetris> {
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
                      if (leftBrick.substring(leftBrick.length - 1, leftBrick.length) != "1") {
                        if(!(bricks[randInt][pos]!.any((element) => ocupiedPos.contains(element - 1)))) {
                          brickDown("left");
                        }
                        currentBrick.clear();
                        currentBrick.addAll(bricks[randInt][pos]!);
                      }
                    },
                    child: const Text('Left')),
                ElevatedButton(
                    onPressed: () {
                      String leftBrick = currentBrick[3].toString();
                      if (leftBrick.substring(leftBrick.length - 1, leftBrick.length) != "0") {
                        if(!(bricks[randInt][pos]!.any((element) => ocupiedPos.contains(element + 1)))) {
                          brickDown("right");
                        }
                        currentBrick.clear();
                        currentBrick.addAll(bricks[randInt][pos]!);
                      }
                    },
                    child: const Text('Right')),
                ElevatedButton(
                    onPressed: () {
                    int val = pos;
                    if(!(bricks[randInt][ val < 3 ? val + 1 : val = 0]!.any((element) => ocupiedPos.contains(element)))) {
                      rotate();
                     }
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
            brickDown("down");
            //changeBrickValue('down');
            currentBrick.clear();
            currentBrick.addAll(bricks[randInt][pos]!);
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

  brickDown(type) {
    for(int i = 0; i <= 3 ; i++) {
      for(int j = 0; j <= 3; j++) {
        if(type == "down") {
          bricks[randInt][i]![j] = bricks[randInt][i]![j] + 10;
        } else if(type == "left") {
            bricks[randInt][i]![j] = bricks[randInt][i]![j] - 1;
        } else if(type == "right") {
          bricks[randInt][i]![j] = bricks[randInt][i]![j] + 1;
        }
      }
    }
  }

  checkClearRow() {
    ocupiedPos.sort();
    for (int i = 1; i <= 20; i++) {
      if (checkRow((i * 10) - 9, i * 10)) {
        ocupiedPos.removeRange(ocupiedPos.indexOf((i * 10) - 9), ocupiedPos.indexOf(i * 10));
        ocupiedPos.forEach((element) {
          if(element < i*10) {
            ocupiedPos[ocupiedPos.indexOf(element)] = element + 10;
          }
        });
      }
    }
  }

  checkRow(int a, int b) {
    List<bool> rowOccupied = [];
    rowOccupied.clear();
    for (int i = a; i <= b; i++) {
      rowOccupied.add(ocupiedPos.contains(i));
    }
    return !rowOccupied.contains(false);
  }

}
