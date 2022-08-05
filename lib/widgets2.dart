import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeroTable extends ConsumerWidget {
  const HeroTable({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref){
    return SizedBox(
      height: 330,
      child: Column(
      children: [
          const SizedBox(
            height: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
              'Hero Table',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, inherit: false, fontSize: 20),
            )
            )
          ),
          SizedBox(
            height: 300,
            child: Scaffold(body: Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: Row(
                      children: const[
                        CharacterCard(name: 'HuTao'), CharacterCard(name: 'Kazuha')
                      ]
                    ),
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}

class CharacterCard extends StatelessWidget {
  final String name;

  // ignore: use_key_in_widget_constructors
  const CharacterCard({
    required this.name
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => 
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Character(name: name,))),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 300,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
          ),
          child: Align(alignment: Alignment.center,
              child: Column(
              children: [
                Hero(tag: name, child: Image.asset('assets/images/${name.toLowerCase()}.png', height: 270)),
                Text(name, 
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, inherit: false, fontSize: 20),
                )
              ],
            ),
          )
        )
      )
    );
  }
}

class Character extends StatelessWidget {
  final String name;

  // ignore: use_key_in_widget_constructors
  const Character({
    required this.name
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        color: Colors.blue,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 400),
            color: Colors.white,
            child:Column(
            children: [
              SizedBox(height: 500, width: 500, child: Hero(tag: name, child: Image.asset('assets/images/${name.toLowerCase()}.png',))),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, inherit: false, fontSize: 20),)
            ],
          ),
        )
      )
    );
  }
}

Widget characters = const HeroTable();