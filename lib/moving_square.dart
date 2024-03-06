import 'package:flutter/material.dart';

enum DirectionOfSquare { up, down, left, right }

class SquarePosition extends ChangeNotifier {
  double _x = 100.0;
  double _y = 100.0;

  double get x => _x;
  double get y => _y;
  bool canMoveUp = true;
  bool canMoveDown = true;
  bool canMoveLeft = true;
  bool canMoveRight = true;

  void move(DirectionOfSquare direction) {
    switch (direction) {
      case DirectionOfSquare.up:
        if (_y > 0) {
          _y -= 50.0;
          if (_y == 0) {
            canMoveUp = false;
          } else {
            canMoveDown = true;
          }
        }
        break;
      case DirectionOfSquare.down:
        if (_y < 100) {
          _y += 50.0;
          if (_y == 100) {
            canMoveDown = false;
          } else {
            canMoveUp = true;
          }
        }
        break;
      case DirectionOfSquare.left:
        if (_x > 0) {
          _x -= 50.0;
          if (_x == 0) {
            canMoveLeft = false;
          } else {
            canMoveRight = true;
          }
        }
        break;
      case DirectionOfSquare.right:
        if (_x < 100) {
          _x += 50.0;
          if (_x == 100) {
            canMoveRight = false;
          } else {
            canMoveLeft = true;
          }
        }
        break;
    }

    notifyListeners();
  }
}

class MoveSquareScreen extends StatelessWidget {
  final SquarePosition squarePosition;

  const MoveSquareScreen({Key? key, required this.squarePosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.square, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Перемещение квадратика',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GoblinOne',
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListenableBuilder(
              listenable: squarePosition,
              builder: (context, child) => Container(
                width: 150.0,
                height: 150.0,
                color: Colors.grey[300],
                child: Stack(
                  children: [
                    Positioned(
                      left: squarePosition.x,
                      top: squarePosition.y,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 20.0),
            ListenableBuilder(
              listenable: squarePosition,
              builder: (context, child) => ElevatedButton(
                onPressed: squarePosition.canMoveUp
                    ? () => squarePosition.move(DirectionOfSquare.up)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      squarePosition.canMoveUp ? Colors.pink : Colors.grey,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Вверх', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ListenableBuilder(
                  listenable: squarePosition,
                  builder: (context, child) => ElevatedButton(
                    onPressed: squarePosition.canMoveLeft
                        ? () => squarePosition.move(DirectionOfSquare.left)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: squarePosition.canMoveLeft
                          ? Colors.pink
                          : Colors.grey,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child:
                          Text('Влево', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                ListenableBuilder(
                  listenable: squarePosition,
                  builder: (context, child) => ElevatedButton(
                    onPressed: squarePosition.canMoveRight
                        ? () => squarePosition.move(DirectionOfSquare.right)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: squarePosition.canMoveRight
                          ? Colors.pink
                          : Colors.grey,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child:
                          Text('Вправо', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ListenableBuilder(
              listenable: squarePosition,
              builder: (context, child) => ElevatedButton(
                onPressed: squarePosition.canMoveDown
                    ? () => squarePosition.move(DirectionOfSquare.down)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      squarePosition.canMoveDown ? Colors.pink : Colors.grey,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Вниз', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
