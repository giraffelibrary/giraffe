signature GTK_MOVEMENT_STEP =
  sig
    datatype enum =
      LOGICAL_POSITIONS
    | VISUAL_POSITIONS
    | WORDS
    | DISPLAY_LINES
    | DISPLAY_LINE_ENDS
    | PARAGRAPHS
    | PARAGRAPH_ENDS
    | PAGES
    | BUFFER_ENDS
    | HORIZONTAL_PAGES
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
