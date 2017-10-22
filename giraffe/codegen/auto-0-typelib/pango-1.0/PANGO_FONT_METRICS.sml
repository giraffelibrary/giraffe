signature PANGO_FONT_METRICS =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val getApproximateCharWidth : t -> LargeInt.int
    val getApproximateDigitWidth : t -> LargeInt.int
    val getAscent : t -> LargeInt.int
    val getDescent : t -> LargeInt.int
    val getStrikethroughPosition : t -> LargeInt.int
    val getStrikethroughThickness : t -> LargeInt.int
    val getUnderlinePosition : t -> LargeInt.int
    val getUnderlineThickness : t -> LargeInt.int
  end
