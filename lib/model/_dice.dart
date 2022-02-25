import 'dart:math';

class Dice {
  final int _sides;
  final int _numberOfDice;

  Dice(this._numberOfDice, this._sides);

  int rollDice() {
    final random = Random();
    var result = 0;

    for (int i = 0; i < _numberOfDice; i++) {
      result += 1 + random.nextInt(_sides);
    }

    return result;
  }

  @override
  String toString() => '${_numberOfDice}d$_sides';
}