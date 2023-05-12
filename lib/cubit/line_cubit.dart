import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/line.dart';

part 'line_state.dart';

class LineCubit extends Cubit<LineState> {
  LineCubit() : super(const LineState(line: Line.empty));

  // TODO: 把state全都放到这个类里，让类来控制。
  // https://bloclibrary.dev/#/fluttertodostutorial

  void selectSelf(Line line) {
    emit(LineState(status: LineStatus.editing, line: line.copyWith()));
  }

  void complete(Line line) {
    emit(LineState(status: LineStatus.initial, line: line.copyWith()));
  }

  void selectNext(Line line) {
    complete(line);
    // 下一个的状态没法获取
    final newLine = line.copyWith(index: line.index + 1);
    emit(LineState(status: LineStatus.editing, line: newLine));
  }
}
