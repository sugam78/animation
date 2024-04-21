import 'package:animation/staggred_animation.dart';
import 'package:animation/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 400;
  double _width = 200;
  double _margin = 0;
  double _opacity = 1;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Animation'),
      ),
      body: Column(
        children: [
          AnimatedContainer(
              duration: Duration(seconds: 2),
            height: _height,
            margin: EdgeInsets.all(_margin),
            color: _color,
            width: _width,
            child: Column(
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    _margin = 50;
                  });
                },
              child: Text('Animate margin'),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    _color = Colors.red;
                  });
                },
                  child: Text('Animate Color'),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    _opacity = 0;
                  });
                },
                  child: Text('Hide Text'),
                ),
                AnimatedOpacity(opacity: _opacity, duration: Duration(seconds: 2),
                child: Text('Hide me'),
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    _height = 300;
                    _width = 300;
                  });
                },
                  child: Text('Animate hei + width'),
                ),
              ],
            ),
         ),
          TweenAnimationBuilder(
            child: Text('Hello'),
              tween: Tween<double>(begin: 0,end: 1),
              duration: Duration(seconds: 2),
              builder: (context,double _opacity,child){
                return Opacity(
                    opacity:_opacity,
                  child: Padding(padding: EdgeInsets.only(top: _opacity*20),
                  child: child,
                  ),
                );
              }
          ),
          SizedBox(height: 20,),
          Hero(
              tag: 'hello',
              child: InkWell(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen())),
                child: Image(
                  height: 250,
                  image: AssetImage('Images/dd.jpg'),
                ),
              ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation){
            return ListenableProvider(
                create: (context)=> animation,
              child: StaggredAnimation(
              ),
            );
          },
            transitionDuration: const Duration(seconds: 1),
          ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
