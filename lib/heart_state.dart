import 'package:flutter/material.dart';

class HeartState extends StatefulWidget {
  const HeartState({super.key});

  @override
  State<HeartState> createState() => _HeartStateState();
}

class _HeartStateState extends State<HeartState> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){

        },
        icon: Icon(Icons.favorite)
    );
  }
}
