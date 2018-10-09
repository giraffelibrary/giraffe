signature GTK_TOOLBAR_SPACE_STYLE =
  sig
    datatype enum =
      EMPTY
    | LINE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
