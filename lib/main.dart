import 'package:flame/game.dart';
import 'package:flame_b/bloc/coin_bloc.dart';
import 'package:flame_b/players/coin.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'players/heart.dart';

void main() {
  runApp(const BlocGame());
}

class BlocGame extends StatelessWidget {
  const BlocGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<CoinBloc>(
              create: (_) => CoinBloc(),
            )
          ],
          child: Stack(
            children: const [
              Positioned.fill(child: Game()),
              Positioned(
                bottom: 10,
                right: 10,
                child: ScoreScreen(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinBloc, CoinState>(
      builder: (context, state) {
        return Text(
          'coins: ${state.coinNumber}',
          style: TextStyle(color: Colors.blue, fontSize: 64),
        );
      },
    );
  }
}

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: MainGame(coinBloc: context.read<CoinBloc>()));
  }
}

class MainGame extends FlameGame with HasTappables {
  final CoinBloc coinBloc;
  MainGame({required this.coinBloc});
  late Coin coin;

  @override
  Future<void> onLoad() async {
    await add(
      FlameMultiBlocProvider(providers: [
        FlameBlocProvider<CoinBloc, CoinState>.value(value: coinBloc)
      ], children: [
        Coin(x: 200),
        Heart(x: 20),
      ]),
    );
  }
}
