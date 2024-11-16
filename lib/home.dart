import 'dart:async';
import 'dart:math';
import 'dart:developer';

import 'package:bdotimers/Components/TimerCard.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<Card> dynamicList = [];

  void onAddTimerClick()
  {
    var protoCard = const Card(
        color: Colors.amber,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TimerCard()
            ],
          )
        )
      );

    setState(() {
      dynamicList.add(protoCard);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Container(
        height: 50,
        width: 150,
        margin: const EdgeInsets.all(20),
        child: FloatingActionButton(
          backgroundColor: theme.colorScheme.inversePrimary,
          onPressed: onAddTimerClick, child: const Center(child: Icon(Icons.add),)),
      ),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: dynamicList
            ),
          ),
        ], // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}