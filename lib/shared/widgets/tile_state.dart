/// Visual variants of `TileWidget`; the widget maps each to a gradient, an
/// optional ring and an optional badge. Red five is not a state: it comes
/// from the tile itself. No « highlighted »: a miss never reveals the answer.
enum TileState {
  /// Default state
  normal,

  /// Picked but not yet checked (quiz option, drill tile, rack tile).
  selected,

  /// Answered right
  correct,

  /// Answered wrong
  incorrect,

  /// Back shown, symbol hidden.
  faceDown,
}
