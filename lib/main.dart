import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

void main () {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Layout Demo",
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Layout Demo"),),
      body: const MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ImageSection(image: "./assets/images/study.jpg"),
        TitleSection(title: "Add the TextSection widget", location: "The text block as sketch UI"),
        ButtonGroup(),
        MyTextSection(decoration: "Add a new TextSection widget as a child after the ButtonSection. When adding the TextSection widget, set its description property to the text of the location description.",)
      ],
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 450,
      fit: BoxFit.cover,
    );
  }
}

class TitleSection extends StatelessWidget{
  const TitleSection({super.key, required this.title, required this.location});

  final String title;
  final String location;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: .0),
                  child: Text(title, style: const TextStyle(fontSize: 12),),
                ),
                Text(location, style: const TextStyle(fontSize: 9),)
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.red,),
          const Text("41")
        ],
      ), 
    );
  }
}

class ButtonGroup extends StatelessWidget {
  const ButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        MyButton(name: "Call", icon: Icons.phone, color: Color.fromARGB(200, 0, 255, 0)),
        MyButton(name: "Delete", icon: Icons.delete, color: Color.fromARGB(200, 0, 255, 0)),
        MyButton(name: "Add", icon: Icons.post_add, color: Color.fromARGB(200, 0, 255, 0)),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.name,
    required this.icon,
    required this.color
  });
  
  final String name;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(name, style: TextStyle(color: color),)
        ),
        Icon(icon, color: color,)
      ],
    );
  }
}


class MyTextSection extends StatelessWidget{
  const MyTextSection({
    super.key,
    required this.decoration
  });

  final String decoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(decoration, softWrap: true,),
    );
  }
}
