import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_b/bloc/coin_bloc.dart';
import 'package:flame_b/main.dart';
import 'package:flame_bloc/flame_bloc.dart';

class Heart extends SpriteComponent
    with
        Tappable,
        HasGameRef<MainGame>,
        FlameBlocListenable<CoinBloc, CoinState> {
  final double x;
  Heart({required this.x}) : super(position: Vector2(x, 30));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('heart.png');
    size = Vector2.all(100);
  }

  CoinState? state;

  @override
  void onNewState(CoinState state) {
    this.state = state;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    print('heart tapped');
    gameRef.coinBloc.add(DecrementCoinEvent());
    return super.onTapUp(info);
  }
}
