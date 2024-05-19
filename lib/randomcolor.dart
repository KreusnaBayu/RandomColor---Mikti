import 'package:flutter/material.dart';
import 'dart:math';

class DraggableContainer extends StatefulWidget {
  @override
  _DraggableContainerState createState() => _DraggableContainerState();
}

class _DraggableContainerState extends State<DraggableContainer> {
  Offset position = Offset(100, 100);
  Color containerColor = Colors.blue;

  void changeColor() {
    setState(() {
      containerColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: position.dx,
          top: position.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                position += details.delta;
              });
            },
            onTap: () {
              changeColor();
            },
            child: Container(
              width: 200.0,
              height: 200.0,
              color: containerColor,
              child: Center(
                child: Text(
                  'catch me!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}