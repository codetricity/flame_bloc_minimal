import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinState.initial()) {
    on<IncrementCoinEvent>((event, emit) {
      emit(CoinState(coinNumber: state.coinNumber + 1));
    });
    on<DecrementCoinEvent>(
        ((event, emit) => emit(CoinState(coinNumber: state.coinNumber - 1))));
  }
}
