import 'package:get_it/get_it.dart';
import 'package:tictactoe/bloc/game_bloc.dart';

final getItInstance = GetIt.I;

Future<void> initDependencies() async {
  getItInstance.registerLazySingleton<GameBloc>(GameBloc.new);
}
