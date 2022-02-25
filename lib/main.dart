import 'package:altherdiceroller/icons/dice_icons_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/_dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Alther Dice Roller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _result = 0;

  final List<Dice> _allDices = [
    Dice(2,4),
    Dice(0,6),
    Dice(1,8),
    Dice(0,10),
    Dice(0,12),
    Dice(1,20)
  ];

  void _rollDice() {
    _result = 0;
    var roll = 0;
    setState(() {
      for(var dice in _allDices) {
        roll = dice.rollDice();
        _result += roll;
        if (kDebugMode) {
          print('$dice Roll: $roll');
          print('Result: $_result');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Attack',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                        DiceIcons.d4,
                    ),
                    Text(
                      '2',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      DiceIcons.d6,
                    ),
                    Text(
                      '0',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      DiceIcons.d8,
                    ),
                    Text(
                      '1',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      DiceIcons.d10,
                    ),
                    Text(
                      '0',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      DiceIcons.d12,
                    ),
                    Text(
                      '0',
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      DiceIcons.d20,
                    ),
                    Text(
                      '1',
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '$_result',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton.icon(
                onPressed: _rollDice,
                label: const Text(
                  'Roll',
                ),
                icon: const Icon(DiceIcons.d6Face6, size: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
