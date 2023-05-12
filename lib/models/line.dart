import 'package:equatable/equatable.dart';

class Line extends Equatable {
  const Line({
    required this.index,
    required this.rawText,
    this.dstText = "",
  });

  final int index;
  final String rawText;
  final String dstText;

  Line copyWith({
    int? index,
    String? rawText,
    String? dstText,
  }) {
    return Line(
      index: index ?? this.index,
      rawText: rawText ?? this.rawText,
      dstText: dstText ?? this.dstText,
    );
  }

  static const empty = Line(
    index: -1,
    rawText: '',
  );

  @override
  List<Object?> get props => [rawText, dstText];
}
