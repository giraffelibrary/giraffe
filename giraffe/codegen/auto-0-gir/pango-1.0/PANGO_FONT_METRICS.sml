signature PANGO_FONT_METRICS =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val getApproximateCharWidth : record_t -> LargeInt.int
    val getApproximateDigitWidth : record_t -> LargeInt.int
    val getAscent : record_t -> LargeInt.int
    val getDescent : record_t -> LargeInt.int
    val getStrikethroughPosition : record_t -> LargeInt.int
    val getStrikethroughThickness : record_t -> LargeInt.int
    val getUnderlinePosition : record_t -> LargeInt.int
    val getUnderlineThickness : record_t -> LargeInt.int
  end
