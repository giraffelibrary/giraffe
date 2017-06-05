signature GTK_ALIGN =
  sig
    datatype enum =
      FILL
    | START
    | END
    | CENTER
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
