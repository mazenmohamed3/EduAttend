import 'package:flutter_bloc/flutter_bloc.dart';

class BoolCubit extends Cubit<bool> {
  BoolCubit({required bool startWith}) : super(startWith);
  static BoolCubit get(context) => BlocProvider.of<BoolCubit>(context);

  void changeState({bool? newState}) => emit(newState ?? !state);
  void onCreate(Function function) => function();

  resetState() {
    emit(false);
  }
}