signature GDK_NOTIFY_TYPE =
  sig
    datatype enum =
      ANCESTOR
    | VIRTUAL
    | INFERIOR
    | NONLINEAR
    | NONLINEAR_VIRTUAL
    | UNKNOWN
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
