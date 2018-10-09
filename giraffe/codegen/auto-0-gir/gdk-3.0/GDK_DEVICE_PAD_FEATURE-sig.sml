signature GDK_DEVICE_PAD_FEATURE =
  sig
    datatype enum =
      BUTTON
    | RING
    | STRIP
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
