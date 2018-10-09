signature GTK_SHADOW_TYPE =
  sig
    datatype enum =
      NONE
    | IN
    | OUT
    | ETCHED_IN
    | ETCHED_OUT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
