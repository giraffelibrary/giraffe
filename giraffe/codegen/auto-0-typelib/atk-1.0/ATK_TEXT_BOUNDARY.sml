signature ATK_TEXT_BOUNDARY =
  sig
    datatype enum =
      CHAR
    | WORD_START
    | WORD_END
    | SENTENCE_START
    | SENTENCE_END
    | LINE_START
    | LINE_END
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
