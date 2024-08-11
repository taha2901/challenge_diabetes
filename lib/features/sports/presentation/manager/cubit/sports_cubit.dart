import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sports_state.dart';

class SportsCubit extends Cubit<SportsState> {
  SportsCubit() : super(SportsInitial());
}
