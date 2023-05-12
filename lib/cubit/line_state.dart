part of 'line_cubit.dart';

enum LineStatus { initial, editing, success }

extension LineStatusX on LineStatus {
  bool get isInitial => this == LineStatus.initial;
  bool get isEditing => this == LineStatus.editing;
  bool get isSuccess => this == LineStatus.success;
}

class LineState extends Equatable {
  const LineState({this.status = LineStatus.initial, required this.line});

  final LineStatus status;
  final Line line;

  LineState copyWith({
    LineStatus? status,
    Line? line,
  }) {
    return LineState(
      status: status ?? this.status,
      line: line ?? this.line,
    );
  }

  @override
  List<Object?> get props => [status, line];
}
