import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Первое приложение',
      home: MoveSquareScreen(),
    );
  }
}

class MoveSquareScreen extends StatefulWidget {
  @override
  _MoveSquareScreenState createState() => _MoveSquareScreenState();
}

class _MoveSquareScreenState extends State<MoveSquareScreen> {
  double squarePositionX = 100.0;
  double squarePositionY = 100.0;

  bool canMoveUp = true;
  bool canMoveDown = true;
  bool canMoveLeft = true;
  bool canMoveRight = true;

  void moveSquare(String direction) {
    setState(() {
      switch (direction) {
        case 'up':
          if (squarePositionY > 0) {
            squarePositionY -= 50.0;
            if (squarePositionY == 0) {
              canMoveUp = false;
            } else {
              canMoveDown = true;
            }
          }
          break;
        case 'down':
          if (squarePositionY < 100) {
            squarePositionY += 50.0;
            if (squarePositionY == 100) {
              canMoveDown = false;
            } else {
              canMoveUp = true;
            }
          }
          break;
        case 'left':
          if (squarePositionX > 0) {
            squarePositionX -= 50.0;
            if (squarePositionX == 0) {
              canMoveLeft = false;
            } else {
              canMoveRight = true;
            }
          }
          break;
        case 'right':
          if (squarePositionX < 100) {
            squarePositionX += 50.0;
            if (squarePositionX == 100) {
              canMoveRight = false;
            } else {
              canMoveLeft = true;
            }
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.square, color: Colors.white), // первая иконка
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
            Container(
              width: 150.0,
              height: 150.0,
              color: Colors.grey[300],
              child: Stack(
                children: [
                  Positioned(
                    left: squarePositionX,
                    top: squarePositionY,
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              color: Colors.black,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: canMoveUp ? () => moveSquare('up') : null,
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Вверх', style: TextStyle(color: Colors.white))),
              style: ElevatedButton.styleFrom(
                primary: canMoveUp ? Colors.pink : Colors.grey,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: canMoveLeft ? () => moveSquare('left') : null,
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child:
                          Text('Влево', style: TextStyle(color: Colors.white))),
                  style: ElevatedButton.styleFrom(
                    primary: canMoveLeft ? Colors.pink : Colors.grey,
                  ),
                ),
                ElevatedButton(
                  onPressed: canMoveRight ? () => moveSquare('right') : null,
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Вправо',
                          style: TextStyle(color: Colors.white))),
                  style: ElevatedButton.styleFrom(
                    primary: canMoveRight ? Colors.pink : Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: canMoveDown ? () => moveSquare('down') : null,
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Вниз', style: TextStyle(color: Colors.white))),
              style: ElevatedButton.styleFrom(
                primary: canMoveDown ? Colors.pink : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
