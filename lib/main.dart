import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets/widgets1.dart';
import 'package:widgets/widgets2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProviderScope(child: Scaffold(body: const HomePage(), appBar: AppBar(title: 
        Align(alignment: Alignment.center, child: title,)),
        )
      )
    );
  }
}

final scrollProvider = StateProvider<double>((ref) => 0.0);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    return Container(
      color: Colors.lightBlue,
      margin: const EdgeInsets.symmetric(),
      child: Expanded(child: GestureDetector(
          child: ListView(
            key: const PageStorageKey<String>('homepage'),
            children: [slider, rangeslider, cupertinoSlider, table, characters]
          ),
        )
      ),
    );
  }
}

//used: Container, Column, ListView, SizedBox, Scaffold, Align, Text, Slider, RangeSlider, CupertinoSlider, Table, TableRow, 
//TableCell, Hero, GestureDetector
