import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dd_state.dart';

class DdCubit extends Cubit<DdState> {
  DdCubit() : super(DdInitial());
}
