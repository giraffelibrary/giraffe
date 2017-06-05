signature GTK_RESIZE_MODE =
  sig
    datatype enum =
      PARENT
    | QUEUE
    | IMMEDIATE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
