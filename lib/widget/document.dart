import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranzdoc/models/line.dart';

import '../cubit/line_cubit.dart';

class DocWidget extends StatefulWidget {
  const DocWidget({super.key});

  @override
  State<DocWidget> createState() => _DocWidgetState();
}

class _DocWidgetState extends State<DocWidget> {
  // final List<Widget> widgetsList = [];
  List<LineState> stateList = [];

  @override
  void initState() {
    // for (int i = 0; i < 5; i++) {
    //   widgetsList.add(MyWidget(text: "Heloow world"));
    // }
    for (int i = 0; i < 5; i++) {
      stateList.add(LineState(line: Line(index: i, rawText: 'Hellow World')));
    }
    super.initState();
  }

  void _handleTap(LineState state) {
    context.read<LineCubit>().selectSelf(state.line);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: stateList
            .map(
              (widgetState) => BlocBuilder<LineCubit, LineState>(
                buildWhen: (previous, current) {
                  return current.line.index == widgetState.line.index;
                },
                builder: (context, state) {
                  if (state.line == Line.empty) {
                    state = widgetState;
                  }
                  widgetState = state;
                  return GestureDetector(
                    onTap: () => _handleTap(widgetState),
                    child: MyWidget(state: widgetState),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final LineState state;
  const MyWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: state.line.rawText,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
