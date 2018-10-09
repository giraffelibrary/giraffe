signature GTK_SOURCE_VIEW_GUTTER_POSITION =
  sig
    datatype enum =
      LINES
    | MARKS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
