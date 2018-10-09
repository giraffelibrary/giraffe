signature GTK_ORIENTATION =
  sig
    datatype enum =
      HORIZONTAL
    | VERTICAL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
