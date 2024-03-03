import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ' Первое приложение',
      home: MoveSquareScreen(),
    );
  }
}

class MoveSquareScreen extends StatefulWidget {
  const MoveSquareScreen({super.key});

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

  // Не используй стринг для определения направления движения куба.
  // Тут лучше использовать enum.
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
        title: const Center(
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
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: canMoveUp ? () => moveSquare('up') : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: canMoveUp ? Colors.pink : Colors.grey,
              ),
              child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Вверх', style: TextStyle(color: Colors.white))),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: canMoveLeft ? () => moveSquare('left') : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: canMoveLeft ? Colors.pink : Colors.grey,
                  ),
                  child: const Padding(
                      padding: EdgeInsets.all(15),
                      child:
                          Text('Влево', style: TextStyle(color: Colors.white))),
                ),
                ElevatedButton(
                  onPressed: canMoveRight ? () => moveSquare('right') : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: canMoveRight ? Colors.pink : Colors.grey,
                  ),
                  child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Вправо',
                          style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: canMoveDown ? () => moveSquare('down') : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: canMoveDown ? Colors.pink : Colors.grey,
              ),
              child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Вниз', style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}
