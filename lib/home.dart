import 'dart:math';
import 'dart:developer';

import 'package:flutter/material.dart';


//   Timer _timer;
//   int _start = 10;

// void startTimer() {
//   const oneSec = const Duration(seconds: 1);
//   _timer = new Timer.periodic(
//     oneSec,
//     (Timer timer) {
//       if (_start == 0) {
//         setState(() {
//           timer.cancel();
//         });
//       } else {
//         setState(() {
//           _start--;
//         });
//       }
//     },
//   );
// }

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
  int _counter = 0;
  List<Card> dynamicList = [];
  
  var protoCard = Card(
    color: Colors.amber,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Text('chrono 1 ${dynamicList.length}')
    )
  );

  void onAddTimerClick()
  {
    print("onAddTimerClick pressed");
    setState(() {
      dynamicList.add(protoCard);
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: dynamicList
          ),
          // FloatingActionButton(
          //   onPressed: _incrementCounter,
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.add),
          // )
        ] // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}