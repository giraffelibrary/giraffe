signature GTK_DELETE_TYPE =
  sig
    datatype enum =
      CHARS
    | WORD_ENDS
    | WORDS
    | DISPLAY_LINES
    | DISPLAY_LINE_ENDS
    | PARAGRAPH_ENDS
    | PARAGRAPHS
    | WHITESPACE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
