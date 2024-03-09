import 'package:bloc/bloc.dart';

enum DirectionOfSquare { up, down, left, right }

class SquarePositionState {
  final double x;
  final double y;
  final bool canMoveUp;
  final bool canMoveDown;
  final bool canMoveLeft;
  final bool canMoveRight;

  SquarePositionState({
    required this.x,
    required this.y,
    required this.canMoveUp,
    required this.canMoveDown,
    required this.canMoveLeft,
    required this.canMoveRight,
  });
}

class SquarePositionCubit extends Cubit<SquarePositionState> {
  SquarePositionCubit()
      : super(SquarePositionState(
          x: 100.0,
          y: 100.0,
          canMoveUp: true,
          canMoveDown: true,
          canMoveLeft: true,
          canMoveRight: true,
        ));

  void move(DirectionOfSquare direction) {
    double x = state.x;
    double y = state.y;
    bool canMoveUp = state.canMoveUp;
    bool canMoveDown = state.canMoveDown;
    bool canMoveLeft = state.canMoveLeft;
    bool canMoveRight = state.canMoveRight;

    switch (direction) {
      case DirectionOfSquare.up:
        if (y > 0) {
          y -= 50.0;
          if (y == 0) {
            canMoveUp = false;
          } else {
            canMoveDown = true;
          }
        }
        break;
      case DirectionOfSquare.down:
        if (y < 100) {
          y += 50.0;
          if (y == 100) {
            canMoveDown = false;
          } else {
            canMoveUp = true;
          }
        }
        break;
      case DirectionOfSquare.left:
        if (x > 0) {
          x -= 50.0;
          if (x == 0) {
            canMoveLeft = false;
          } else {
            canMoveRight = true;
          }
        }
        break;
      case DirectionOfSquare.right:
        if (x < 100) {
          x += 50.0;
          if (x == 100) {
            canMoveRight = false;
          } else {
            canMoveLeft = true;
          }
        }
        break;
    }
    emit(SquarePositionState(
      x: x,
      y: y,
      canMoveUp: canMoveUp,
      canMoveDown: canMoveDown,
      canMoveLeft: canMoveLeft,
      canMoveRight: canMoveRight,
    ));
  }
}
