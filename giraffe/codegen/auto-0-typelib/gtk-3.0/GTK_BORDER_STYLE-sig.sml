signature GTK_BORDER_STYLE =
  sig
    datatype enum =
      NONE
    | SOLID
    | INSET
    | OUTSET
    | HIDDEN
    | DOTTED
    | DASHED
    | DOUBLE
    | GROOVE
    | RIDGE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end