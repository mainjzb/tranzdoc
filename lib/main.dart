import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:tranzdoc/widget/editer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _widgetsList = [];
  int index = -1;

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      _widgetsList.add(
        // ignore: prefer_const_constructors
        Text.rich(
          const TextSpan(
            text: 'Hello, ',
            style: TextStyle(fontSize: 20),
            children: <TextSpan>[
              TextSpan(
                text: 'world',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '!'),
            ],
          ),
        ),
      );
    }
    super.initState();
  }

  void _handleTap(Widget thisWidget) {
    int index = _widgetsList.indexOf(thisWidget);
    setState(() {
      _widgetsList.insert(
        index + 1,
        Text.rich(
          TextSpan(
            text: 'New widget added after widget $index',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var multiSplitView = MultiSplitView(children: [
      SingleChildScrollView(
        child: Column(
          children: _widgetsList
              .map(
                (widget) => GestureDetector(
                  onTap: () => _handleTap(widget),
                  child: widget,
                ),
              )
              .toList(),
        ),
      ),
      Editor(index),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MultiSplitViewTheme(
          data: MultiSplitViewThemeData(
              dividerPainter: DividerPainters.background(
                  color: Colors.grey[200], highlightedColor: Colors.grey[800])),
          child: multiSplitView),
    );
  }
}
