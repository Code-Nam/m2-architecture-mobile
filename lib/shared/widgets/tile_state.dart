/// Visual variants of `TileWidget`; the widget maps each to a gradient, a
/// ring or halo, and an optional badge. Red five is not a state: it comes
/// from the tile itself.
enum TileState {
  /// Default state
  normal,

  /// Tapped in a quiz
  selected,

  /// Answered right
  correct,

  /// Answered wrong
  incorrect,

  /// Soft green halo: the tile an explanation is talking about.
  highlighted,

  /// Back shown, symbol hidden.
  faceDown,
}
