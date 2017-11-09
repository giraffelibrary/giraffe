signature VTE_TERMINAL_ANTI_ALIAS =
  sig
    datatype enum =
      USE_DEFAULT
    | FORCE_ENABLE
    | FORCE_DISABLE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
