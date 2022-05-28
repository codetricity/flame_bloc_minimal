import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_b/bloc/coin_bloc.dart';
import 'package:flame_b/main.dart';
import 'package:flame_bloc/flame_bloc.dart';

class Coin extends SpriteComponent
    with
        Tappable,
        HasGameRef<MainGame>,
        FlameBlocListenable<CoinBloc, CoinState> {
  @override
  final double x;
  Coin({required this.x}) : super(position: Vector2(x, 30));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('coin.png');
    size = Vector2.all(100);
  }

  CoinState? state;

  @override
  void onNewState(CoinState state) {
    this.state = state;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    print('coin tapped');
    gameRef.coinBloc.add(IncrementCoinEvent());
    return super.onTapUp(info);
  }
}
