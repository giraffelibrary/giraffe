signature GDK_DEVICE_TYPE =
  sig
    datatype enum =
      MASTER
    | SLAVE
    | FLOATING
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
