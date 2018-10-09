signature ATK_TEXT_GRANULARITY =
  sig
    datatype enum =
      CHAR
    | WORD
    | SENTENCE
    | LINE
    | PARAGRAPH
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
