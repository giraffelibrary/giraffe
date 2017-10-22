signature GTK_ALIGN =
  sig
    datatype enum =
      FILL
    | START
    | END
    | CENTER
    | BASELINE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
