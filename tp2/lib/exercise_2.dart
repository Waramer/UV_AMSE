import 'dart:math' as math;

import 'package:flutter/material.dart';

class Exercise2a extends StatefulWidget {
  const Exercise2a({Key? key,}) : super(key: key);
  @override
  State<Exercise2a> createState() => _Exercise2aState();
}

class _Exercise2aState extends State<Exercise2a> {

  double rotateX = 0.0;
  double rotateY = 0.0;
  double scale = 1.0;
  bool mirror = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(color: Colors.black),
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationX(rotateX)..rotateY(rotateY+math.pi*(mirror?1:0))..scale(scale),
              child: Image.asset('../assets/thewitcher3.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Rotate X :"),
              Expanded(
                child: Slider(
                  value: rotateX,
                  min: -math.pi,
                  max: math.pi,
                  activeColor: Colors.red.shade900,
                  thumbColor: Colors.red.shade900,
                  inactiveColor: Colors.red.shade900.withAlpha(100),
                  onChanged: (double value){
                    setState(() {
                      rotateX = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Rotate Y :"),
              Expanded(
                child: Slider(
                  value: rotateY,
                  min: -math.pi,
                  max: math.pi,
                  activeColor: Colors.red.shade900,
                  thumbColor: Colors.red.shade900,
                  inactiveColor: Colors.red.shade900.withAlpha(100),
                  onChanged: (double value){
                    setState(() {
                      rotateY = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Scale :"),
              Expanded(
                child: Slider(
                  value: scale,
                  min: 0.0,
                  max: 1.0,
                  activeColor: Colors.red.shade900,
                  thumbColor: Colors.red.shade900,
                  inactiveColor: Colors.red.shade900.withAlpha(100),
                  onChanged: (double value){
                    setState(() {
                      scale = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text("Mirror :"),
              Checkbox(
                value: mirror,
                activeColor: Colors.red.shade900,
                onChanged: (newValue){
                  setState(() {
                    mirror = newValue as bool;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//--------------------------------------------------

class Exercise2b extends StatefulWidget {
  const Exercise2b({Key? key,}) : super(key: key);
  @override
  State<Exercise2b> createState() => _Exercise2bState();
}

class _Exercise2bState extends State<Exercise2b> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Exercice 2b"),
    );
  }
}