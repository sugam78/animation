import 'dart:math';

import 'package:animation/heart_state.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
                tag: 'hello',
                child: Image(
                  image: AssetImage('Images/dd.jpg'),
                )),
            HeartState(),
          ],
        ),
      ),
    );
  }
}
