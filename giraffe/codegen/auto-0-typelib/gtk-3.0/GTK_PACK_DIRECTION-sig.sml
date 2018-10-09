signature GTK_PACK_DIRECTION =
  sig
    datatype enum =
      LTR
    | RTL
    | TTB
    | BTT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
