# Flame Bloc Demo

![screenshot](assets/readme/screenshot.gif)

1. Scaffold body is a `MultiBlocProvider` with child of `Stack`
2. `Stack` is `Game` and `ScoreScreen`
3. `ScoreScreen` is a `StatelessWidget` that returns a `BlocBuilder`. This is the same as
a normal Flutter bloc app
4. `Game` is a `StatelessWidget` returns a `FlameGame` instance with parameters for each bloc.
    `game: MainGame(coinBloc: context.read<CoinBloc>())`
5. `FlameGame` instance adds `FlameMultiBlocProvider`

```dart
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
```

1. `the SpriteComponent` uses `FlameBlocListenable<CoinBloc, CoinState>` listenable

### Change State

```dart
  CoinState? state;

  @override
  void onNewState(CoinState state) {
    this.state = state;
  }
```

### add event

```dart
 @override
  bool onTapUp(TapUpInfo info) {
    print('coin tapped');
    gameRef.coinBloc.add(IncrementCoinEvent());
    return super.onTapUp(info);
  }
```




## Environment

* flame_bloc 1.4
* flame 1.1.1
* flutter 3.0.1

## Reference

* https://github.com/flame-engine/flame/tree/main/packages/flame_bloc/example