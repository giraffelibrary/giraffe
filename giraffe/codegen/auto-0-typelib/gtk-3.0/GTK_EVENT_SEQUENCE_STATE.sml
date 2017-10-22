signature GTK_EVENT_SEQUENCE_STATE =
  sig
    datatype enum =
      NONE
    | CLAIMED
    | DENIED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
