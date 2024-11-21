import 'package:bdotimers/Pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'BDO Timers',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(
          title: 'BDO Timers',
        ),
      )
    );
  }
}

class MyAppState extends ChangeNotifier {
  List<Card> dynamicList = [];
  void addInList(Card card)
  {
    dynamicList.add(card);
    notifyListeners();
  }
}
