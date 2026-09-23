import 'package:tenpai/shared/models/tile.dart';

/// French display name, handoff wording: « 5 de cercles rouge »,
/// « Vent d'est », « Dragon blanc ». Natural case; callers uppercase.
String tileName(Tile tile) => switch (tile.suit) {
  .honor => _honorName(tile.number),
  .man || .pin || .sou =>
    '${tile.number} de ${_familyOf(tile.suit)}${tile.isRed ? ' rouge' : ''}',
};

/// Subtitle line of the result sheet: « famille des cercles » or
/// « honneurs ». Natural case; the sheet uppercases it (mono caps).
String tileFamily(Tile tile) => switch (tile.suit) {
  .honor => 'honneurs',
  _ => 'famille des ${_familyOf(tile.suit)}',
};

String _familyOf(TileSuit suit) => switch (suit) {
  .man => 'caractères',
  .pin => 'cercles',
  .sou => 'bambous',
  .honor => 'honneurs',
};
String _honorName(int number) => switch (number) {
  1 => "Vent d'est",
  2 => 'Vent du sud',
  3 => "Vent de l'ouest",
  4 => 'Vent du nord',
  5 => 'Dragon blanc',
  6 => 'Dragon vert',
  7 => 'Dragon rouge',
  _ => throw ArgumentError.value(number, 'number', 'honour 1–7'),
};
