/// Enumeration representing the possible states of a tile.
enum TileState {
  /// Default state
  normal,

  /// Tapped in a quiz
  selected,

  /// Answered right
  correct,

  /// Answered wrong
  incorrect,

  /// Highlighted state
  highlighted,

  /// Face down state
  faceDown,
}
