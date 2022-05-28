// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'coin_bloc.dart';

class CoinState extends Equatable {
  final int coinNumber;

  const CoinState({required this.coinNumber});

  factory CoinState.initial() => const CoinState(coinNumber: 1);

  @override
  List<Object> get props => [coinNumber];

  CoinState copyWith({
    int? coinNumber,
  }) {
    return CoinState(
      coinNumber: coinNumber ?? this.coinNumber,
    );
  }

  @override
  bool get stringify => true;
}
