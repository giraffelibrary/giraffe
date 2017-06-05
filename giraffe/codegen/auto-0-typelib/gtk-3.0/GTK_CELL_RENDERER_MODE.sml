signature GTK_CELL_RENDERER_MODE =
  sig
    datatype enum =
      INERT
    | ACTIVATABLE
    | EDITABLE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
