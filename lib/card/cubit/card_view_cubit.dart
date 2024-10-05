import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_view_state.dart';

class CardViewCubit extends Cubit<double> {
  CardViewCubit() : super(0.25);

  void updateSize(double newSize) {
    emit(newSize);
  }
}
