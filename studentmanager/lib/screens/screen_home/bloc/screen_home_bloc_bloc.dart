import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screen_home_bloc_event.dart';
part 'screen_home_bloc_state.dart';

class ScreenHomeBlocBloc extends Bloc<ScreenHomeBlocEvent, ScreenHomeBlocState> {
  ScreenHomeBlocBloc() : super(ScreenHomeBlocInitial()) {
    on<ScreenHomeBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
