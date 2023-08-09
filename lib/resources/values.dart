//total number of rows and columns in the game

import 'package:flutter/material.dart';

int maxRow = 20;
int maxCol = 10;

//for movements direction of tetromino
enum Direction {
  left,
  right,
  down,
}

//building tetromino details on https://tetris.fandom.com/wiki/Tetromino
enum Tetromino {
  I,
  O,
  T,
  S,
  Z,
  J,
  L,
  /*
    I tetromino
      o
      o
      o
      o
    O tetromino
      oo
      oo
    T tetromino
      ooo
       o
       O
    S tetromino
       oo
      oo
    Z tetromino
      oo
       oo 
    J tetromino
      o
      o
     oo
    L tetromino
      o
      o
      oo
  */
}

//colors for tetromino https://colorswall.com/palette/9o259
const Map<Tetromino, List<Color>> tetrominoColor = {
  Tetromino.I: [
    Color.fromARGB(80, 174, 181, 161),
    Color.fromARGB(255, 27, 137, 137),
  ],
  Tetromino.O: [
    Color.fromARGB(80, 174, 181, 161),
    Color.fromARGB(255, 133, 12, 133),
  ],
  Tetromino.T: [
    Color.fromARGB(80, 174, 181, 161),
    Color.fromARGB(255, 108, 108, 11),
  ],
  Tetromino.S: [
    Color.fromARGB(80, 174, 181, 161),
    Color.fromARGB(255, 12, 118, 12),
  ],
  Tetromino.Z: [
    Color.fromARGB(80, 174, 181, 161),
    Color.fromARGB(255, 157, 12, 12),
  ],
  Tetromino.J: [
    Color.fromARGB(80, 174, 181, 161),
    Color(0xff0000ff),
  ],
  Tetromino.L: [
    Color.fromARGB(80, 174, 181, 161),
    Color.fromARGB(255, 107, 73, 8),
  ],
};

List<List<Color>> colorGradients = [
  [const Color(0xFF42275a), const Color(0xFF734b6d)],
  [const Color(0xFFffafbd), const Color(0xFFffc3a0)],
  [const Color(0xFF2193b0), const Color(0xFF6dd5ed)],
  [const Color(0xFFcc2b5e), const Color(0xFF753a88)],
  [const Color(0xFFee9ca7), const Color(0xFFffdde1)],
  [const Color(0xFFbdc3c7), const Color(0xFF2c3e50)],
  [const Color(0xFFde6262), const Color(0xFFffb88c)],
  [const Color(0xFF06beb6), const Color(0xFF48b1bf)],
];