signature PANGO_BIDI_TYPE =
  sig
    datatype enum =
      L
    | LRE
    | LRO
    | R
    | AL
    | RLE
    | RLO
    | PDF
    | EN
    | ES
    | ET
    | AN
    | CS
    | NSM
    | BN
    | B
    | S
    | WS
    | ON
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
    val forUnichar : char -> t
  end
