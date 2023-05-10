import 'package:flutter/widgets.dart';

class DocWidget extends StatefulWidget {
  const DocWidget({super.key});

  @override
  State<DocWidget> createState() => _DocWidgetState();
}

class _DocWidgetState extends State<DocWidget> {
  final List<Widget> widgetsList = [];

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      widgetsList.add(
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
    int index = widgetsList.indexOf(thisWidget);
    setState(() {
      widgetsList.insert(
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
    return SingleChildScrollView(
      child: Column(
        children: widgetsList
            .map(
              (widget) => GestureDetector(
                onTap: () => _handleTap(widget),
                child: widget,
              ),
            )
            .toList(),
      ),
    );
  }
}
