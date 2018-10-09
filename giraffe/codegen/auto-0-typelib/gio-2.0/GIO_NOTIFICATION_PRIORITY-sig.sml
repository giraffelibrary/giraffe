signature GIO_NOTIFICATION_PRIORITY =
  sig
    datatype enum =
      NORMAL
    | LOW
    | HIGH
    | URGENT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
