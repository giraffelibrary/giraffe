signature GTK_TEXT_DIRECTION =
  sig
    datatype enum =
      NONE
    | LTR
    | RTL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
