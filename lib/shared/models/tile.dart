import 'package:freezed_annotation/freezed_annotation.dart';

part 'tile.freezed.dart';

/// Enumeration representing the four suits of Mahjong tiles.
enum TileSuit {
  /// The character suit, represented by the letter 'm'.
  man('m'),

  /// The pin suit, represented by the letter 'p'.
  pin('p'),

  /// The sou suit, represented by the letter 's'.
  sou('s'),

  /// The honor suit, represented by the letter 'z'.
  honor('z');

  const TileSuit(this.letter);

  /// The letter representation of the suit.
  final String letter;
}

/// A model representing a Mahjong tile with its suit, number, and red tile status.
@freezed
abstract class Tile with _$Tile {
  const Tile._();

  /// The number of the tile, which must be between 1 and 9 for man, pin, and sou suits, and between 1 and 7 for honor tiles.
  @Assert('number >= 1 && number <= (suit == TileSuit.honor ? 7 : 9)')

  /// Factory constructor for creating a Tile instance.
  const factory Tile({
    required TileSuit suit,
    required int number,
    @Default(false) bool isRed,
  }) = _Tile;

  /// Factory method to parse a string representation of a tile into a Tile object.
  /// example: "1m" for 1 of man, "9s" for 9 of sou, "5pr" for red 5 of pin
  factory Tile.parse(String code) {
    final suit = TileSuit.values.firstWhere((s) => s.letter == code[1]);
    return Tile(suit: suit, number: int.parse(code[0]), isRed: code.endsWith('r'));
  }

  /// Returns a string representation of the tile in the format "number + suit letter + 'r' if red".
  String get code => '$number${suit.letter}${isRed ? 'r' : ''}';
}
