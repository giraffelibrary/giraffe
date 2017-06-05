signature GTK_SOURCE_BRACKET_MATCH_TYPE =
  sig
    datatype enum =
      NONE
    | OUT_OF_RANGE
    | NOT_FOUND
    | FOUND
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
