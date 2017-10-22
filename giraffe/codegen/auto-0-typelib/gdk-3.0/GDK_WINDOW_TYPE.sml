signature GDK_WINDOW_TYPE =
  sig
    datatype enum =
      ROOT
    | TOPLEVEL
    | CHILD
    | TEMP
    | FOREIGN
    | OFFSCREEN
    | SUBSURFACE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
