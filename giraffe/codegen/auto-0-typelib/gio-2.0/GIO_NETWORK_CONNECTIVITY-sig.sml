signature GIO_NETWORK_CONNECTIVITY =
  sig
    datatype enum =
      LOCAL
    | LIMITED
    | PORTAL
    | FULL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
