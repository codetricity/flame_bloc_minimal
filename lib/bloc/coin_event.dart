part of 'coin_bloc.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();

  @override
  List<Object> get props => [];
}

class IncrementCoinEvent extends CoinEvent {}

class DecrementCoinEvent extends CoinEvent {}
