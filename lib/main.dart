import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:tranzdoc/widget/document.dart';
import 'package:tranzdoc/widget/editer_view.dart';

import 'cubit/line_cubit.dart';

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
      home: const MyHome2Page(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHome2Page extends StatelessWidget {
  const MyHome2Page({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var multiSplitView = MultiSplitView(children: const [
      DocWidget(),
      EditorView(),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
            dividerPainter: DividerPainters.background(
                color: Colors.grey[200], highlightedColor: Colors.grey[800])),
        child: BlocProvider(
          create: (context) => LineCubit(),
          child: multiSplitView,
        ),
      ),
    );
  }
}
