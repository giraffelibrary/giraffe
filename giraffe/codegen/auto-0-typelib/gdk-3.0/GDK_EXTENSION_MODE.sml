signature GDK_EXTENSION_MODE =
  sig
    datatype enum =
      NONE
    | ALL
    | CURSOR
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
