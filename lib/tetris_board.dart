import 'package:flutter/material.dart';
import 'package:tetris_game/pixel.dart';
import 'package:tetris_game/resources/button_colors.dart';
import 'package:tetris_game/tetromino_pieces.dart';
import 'package:tetris_game/values.dart';

//initialize board with null values

class TetrisBoard extends StatefulWidget {
  const TetrisBoard({
    super.key,
    required this.currentPiece,
    required this.gameBoard,
  });
  final Piece currentPiece;
  final List<List<Tetromino?>> gameBoard;

  @override
  State<TetrisBoard> createState() => _TetrisBoardState();
}

class _TetrisBoardState extends State<TetrisBoard> {
  @override
  Widget build(BuildContext context) {
    //building the background of the board

    return GridView.builder(
      itemCount: maxRow * maxCol,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: maxCol, mainAxisSpacing: 0, crossAxisSpacing: 0),
      itemBuilder: (context, index) {
        int row = (index / maxCol).floor();
        int col = index % maxCol;
        //display shape of current piece in board
        if (widget.currentPiece.position.contains(index)) {
          return Pixel(
            colors: PieceColor().activePiece,
          );
        } else if (widget.gameBoard[row][col] != null) {
          //display shape of landed piece in board
          //  final Tetromino? shape = gameBoard[row][col];
          return Pixel(colors: PieceColor().activePiece);
        } else {
          //display empty grid
          return Pixel(
            colors: PieceColor().bgPiece,
          );
        }
      },
    );
  }
}

// bool isPaused = false;
//   Timer? gameLoopTimer;
//   Piece nextPiece =
//       Piece(shape: Tetromino.values[Random().nextInt(Tetromino.values.length)]);
//   //assign the current piece to the next piece
//   late Piece currentPiece;
//   //set current score to 0 initially
//   int currentScore = 0;

//   //bool to check if the game is over
//   bool gameOver = false;

//   import tetrisprovider

//   @override
//   void initState() {
//     super.initState();
//     currentPiece = nextPiece;
//     startGame();
//   }

//   //refresh the screen periodically
//   Timer loopGame(Duration frameRefreshRate) {
//     return Timer.periodic(
//       frameRefreshRate,
//       (timer) {
//         if (!isPaused) {
//           setState(() {
//             clearLine();
//             checkLanding();
//             if (gameOver) {
//               timer.cancel();
//               showGameOverMessage();
//             }
//             currentPiece.movePiece(Direction.down);
//           });
//         }
//       },
//     );
//   }

//   //check for the collision of the pieces with the board
//   bool checkCollisions(Direction direction) {
//     //check if the piece can move in the direction
//     for (int i = 0; i < currentPiece.position.length; i++) {
//       //calculate the row and column of the piece in board
//       int row = (currentPiece.position[i] / maxCol).floor();
//       int col = currentPiece.position[i] % maxCol;
//       //calculate the next position of the piece in board
//       if (row + 1 < maxRow && row >= 0 && gameBoard[row + 1][col] != null) {
//         return true; // collision with a landed piece
//       }

//       if (direction == Direction.down) {
//         row++;
//       } else if (direction == Direction.left) {
//         col--;
//         //check if left place is occipied
//         if (gameBoard[row][col] != null) {
//           return true;
//         }
//       } else if (direction == Direction.right) {
//         col++;
//         //check if right place is occipied
//         if (gameBoard[row][col] != null) {
//           return true;
//         }
//       }
//       //check if the piece is at the ends of the board and movements can be done or not
//       if (col < 0 || row >= maxRow || col >= maxCol) {
//         return true;
//       }
//     }
//     //if the piece is not at the ends of the board
//     return false;
//   }

//   //check if the piece is at the ends of the board
//   void checkLanding() {
//     if (checkCollisions(Direction.down)) {
//       //stop the piece from moving
//       for (int i = 0; i < currentPiece.position.length; i++) {
//         int row = (currentPiece.position[i] / maxCol).floor();
//         int col = currentPiece.position[i] % maxCol;

//         //store the piece in the board after landing
//         if (row >= 0 && col >= 0) {
//           gameBoard[row][col] = currentPiece.shape;
//         }
//       }
//       //create new piece after landing
//       createNewPiece();
//     }
//   }

// //create new piece after landing
//   void createNewPiece() {
//     //create new random piece
//     Random ran = Random();
//     Tetromino newShape = Tetromino.values[ran.nextInt(Tetromino.values.length)];
//     currentPiece = Piece(shape: newShape);
//     currentPiece.initializePiece();
//     //check if the game is over
//     if (isGameOver()) {
//       gameOver = true;
//     }
//   }

// //move the piece in the left direction
//   void moveLeft() {
//     if (!isPaused) {
//       if (!checkCollisions(Direction.left)) {
//         setState(() {
//           currentPiece.movePiece(Direction.left);
//         });
//       }
//     }
//   }

// //move the piece in the right direction
//   void moveRight() {
//     if (!isPaused) {
//       if (!checkCollisions(Direction.right)) {
//         setState(() {
//           currentPiece.movePiece(Direction.right);
//         });
//       }
//     }
//   }

// //change the orientation of the piece
//   void rotatePiece() {
//     if (!isPaused) {
//       setState(() {
//         currentPiece.rotatePiece();
//       });
//     }
//   }

//   //clear the lines if full
//   void clearLine() {
//     //loop through each row on the board from bottom
//     for (int row = maxRow - 1; row >= 0; row--) {
//       bool canClear = true;
//       //check if the row is full or not by checking each column
//       for (int col = 0; col < maxCol; col++) {
//         if (gameBoard[row][col] == null) {
//           canClear = false;
//           break;
//         }
//       }
//       //if the row is full then clear the row and move the pieces down
//       if (canClear) {
//         //move the pieces down row by row
//         for (int i = row; i > 0; i--) {
//           gameBoard[i] = List.from(gameBoard[i - 1]);
//         }
//         //set the top row to null
//         gameBoard[0] = List.generate(maxCol, (col) => null);
//         //increase the score by 100
//         setState(() {
//           currentScore += 100;
//         });
//       }
//     }
//   }

// //check if the game is over
//   bool isGameOver() {
//     //if the piece is at the top of the board
//     for (int col = 0; col < maxCol; col++) {
//       if (gameBoard[0][col] != null) {
//         return true;
//       }
//     }
//     return false;
//   }

// //show alert dialog box when game is over
//   void showGameOverMessage() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Game Over'),
//           content: Text('Your Score is: $currentScore'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 resetGame();
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Restart'),
//             )
//           ],
//         );
//       },
//     );
//   }

// //pause the game
//   void togglePause() {
//     setState(() {
//       isPaused = !isPaused;
//     });
//   }

//   void resetGame() {
//     gameBoard =
//         List.generate(maxRow, (row) => List.generate(maxCol, (col) => null));
//     gameOver = false;
//     currentScore = 0;

//     // Cancel the previous timer if it exists
//     gameLoopTimer?.cancel();

//     createNewPiece();
//     startGame();
//   }

//   //dropt the piece instantly
//   void dropPiece() {
//     if (!isPaused) {
//       setState(() {
//         // Keep moving the piece down until it collides or reaches the bottom
//         while (!checkCollisions(Direction.down)) {
//           currentPiece.movePiece(Direction.down);
//         }
//         // Handle landing and create a new piece
//         checkLanding();
//       });
//     }
//   }

//   drop the piece by steps
//    void dropPieceBySteps(int steps) {
//     if (!isPaused) {
//       setState(() {
//         // Move the piece down by the specified number of steps
//         for (int i = 0; i < steps; i++) {
//           if (!checkCollisions(Direction.down)) {
//             currentPiece.movePiece(Direction.down);
//           } else {
//             break;
//           }
//         }
//         // Handle landing and create a new piece
//         checkLanding();
//       });
//     }
//   }
