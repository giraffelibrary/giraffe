signature GIO_TLS_INTERACTION_RESULT =
  sig
    datatype enum =
      UNHANDLED
    | HANDLED
    | FAILED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
