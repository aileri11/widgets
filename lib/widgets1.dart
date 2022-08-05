import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Title extends StatelessWidget{
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(),
      color: Colors.blue,
      child: const Text(
        'Widgets',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, inherit: false, fontSize: 20),
      ),
    );
  }
}

final sliderProvider = StateProvider<double>((ref) => 0.0);
final rangeProvider = StateProvider<RangeValues>((ref) => const RangeValues(0.0, 5.0));
final cupertinoSliderProvider = StateProvider<double>((ref) => 50.0);

class FirstSlider extends ConsumerWidget {
  const FirstSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return SizedBox(
      height: 130,
      child: Column(
      children: [
          const SizedBox(
            height: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
              'Slider',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, inherit: false, fontSize: 20),
            )
            )
          ),
          SizedBox(
            height: 100,
            child: Scaffold(body: Slider(
                value: ref.watch(sliderProvider),
                onChanged: (double value) => ref.read(sliderProvider.notifier).state = value,
                max: 100, 
                divisions: 20,
                label: ref.watch(sliderProvider).round().toString(),
              )
            )
          )
        ]
      )
    );
  }
}

class SecondSlider extends ConsumerWidget {
  const SecondSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return SizedBox(
      height: 130,
      child: Column(
      children: [
          const Align(
            alignment: Alignment.centerLeft, 
            child: SizedBox(
              height: 30,
              child: Text(
                'RangeSlider',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, inherit: false, fontSize: 20),
              )
            )
          ),
          SizedBox(
            height: 100,
            child: Scaffold(body: RangeSlider(
                values: ref.watch(rangeProvider),
                onChanged: (RangeValues range) => ref.read(rangeProvider.notifier).state = range,
                max: 100,
                divisions: 20,
                labels: RangeLabels(ref.watch(rangeProvider).start.round().toString(), ref.watch(rangeProvider).end.round().toString())
              )
            )
          )
        ]
      )
    );
  }
}

class ThirdSlider extends ConsumerWidget {
  const ThirdSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return SizedBox(
      height: 70,
      child: Column(
      children: [
          const SizedBox(
            height: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
              'CupertinoSlider',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, inherit: false, fontSize: 20),
            )
            )
          ),
          SizedBox(
            height: 40,
            child: Scaffold(body: CupertinoSlider(
                value: ref.watch(cupertinoSliderProvider),
                onChanged: (double value) => ref.read(cupertinoSliderProvider.notifier).state = value,
                thumbColor: Colors.blueAccent,
                max: 100,
              )
            )
          )
        ]
      )
    );
  }
}

class TableWithSliders extends ConsumerWidget {
  const TableWithSliders ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return SizedBox(
      height: 230,
      child: Column(
      children: [
          const SizedBox(
            height: 30,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
              'Table',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, inherit: false, fontSize: 20),
            )
            )
          ),
          SizedBox(
            height: 200,
            child: Scaffold(body: Table(
              children: [
                TableRow(children:[
                    SizedBox(height: 100, width: 100,
                      child: Scaffold(body: Slider(
                          value: ref.watch(sliderProvider),
                          onChanged: (double value) => ref.read(sliderProvider.notifier).state = value,
                          max: 100, 
                          divisions: 20,
                          label: ref.watch(sliderProvider).round().toString(),
                        )
                      )
                    ),
                    const SizedBox(height: 100, width: 200,
                      child: Align(
                        alignment: Alignment.center, 
                        child: Text('#GenshinForGays',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, inherit: false, fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ]
                ),
                TableRow(children:[
                  SizedBox(height: 100, width: 100,
                        child: Scaffold(body: RangeSlider(
                        values: ref.watch(rangeProvider),
                        onChanged: (RangeValues range) => ref.read(rangeProvider.notifier).state = range,
                        max: 100,
                        divisions: 20,
                        labels: RangeLabels(ref.watch(rangeProvider).start.round().toString(), ref.watch(rangeProvider).end.round().toString())
                      )
                    )
                  ),
                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Align(alignment: Alignment.center,
                            child: SizedBox(height: 40, width: 200,
                              child: Scaffold(body: CupertinoSlider(
                              value: ref.watch(cupertinoSliderProvider),
                              onChanged: (double value) => ref.read(cupertinoSliderProvider.notifier).state = value,
                              thumbColor: Colors.blueAccent,
                              max: 100,
                            )
                          )
                        )
                      )
                    )
                  ]
                )
              ],
              )
            )
          )
        ]
      )
    );
  }
}

Widget title = const Title();
Widget slider = const FirstSlider();
Widget rangeslider = const SecondSlider();
Widget cupertinoSlider = const ThirdSlider();
Widget table = const TableWithSliders();