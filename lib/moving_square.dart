import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'square_position_cubit.dart';

class MoveSquareScreen extends StatelessWidget {
  const MoveSquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SquarePositionCubit(),
      child: Scaffold(
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
          child: BlocBuilder<SquarePositionCubit, Map<String, dynamic>>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 150.0,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        Positioned(
                          left: state['x'],
                          top: state['y'],
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
                    onPressed: state['canMoveUp']
                        ? () => context
                            .read<SquarePositionCubit>()
                            .move(DirectionOfSquare.up)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          state['canMoveUp'] ? Colors.pink : Colors.grey,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child:
                          Text('Вверх', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: state['canMoveLeft']
                            ? () => context
                                .read<SquarePositionCubit>()
                                .move(DirectionOfSquare.left)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              state['canMoveLeft'] ? Colors.pink : Colors.grey,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text('Влево',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: state['canMoveRight']
                            ? () => context
                                .read<SquarePositionCubit>()
                                .move(DirectionOfSquare.right)
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              state['canMoveRight'] ? Colors.pink : Colors.grey,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text('Вправо',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: state['canMoveDown']
                        ? () => context
                            .read<SquarePositionCubit>()
                            .move(DirectionOfSquare.down)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          state['canMoveDown'] ? Colors.pink : Colors.grey,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child:
                          Text('Вниз', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
