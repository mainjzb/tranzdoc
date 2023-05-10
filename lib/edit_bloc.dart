import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EditEvent {
  const EditEvent();
}

class Select extends EditEvent {
  final int selectedIndex;

  const Select(this.selectedIndex);

  List<Object> get props => [selectedIndex];
}

class Save extends EditEvent {
  final String editedText;

  const Save(this.editedText);

  List<Object> get props => [editedText];
}

abstract class EditState {
  const EditState();

  @override
  List<Object> get props => [];
}

class AInitial extends EditState {}

class BlockSelected extends EditState {
  final int selectedIndex;

  const BlockSelected(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class BlockEditing extends EditState {}

class ABloc extends Bloc<EditEvent, EditState> {
  final TextEditingController controller;

  ABloc({required this.controller}) : super(AInitial()) {
    on<Select>((event, emit) => emit(BlockSelected as EditState));
    on<Save>((event, emit) => emit(AInitial as EditState));
  }
}
