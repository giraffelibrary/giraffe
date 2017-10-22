signature GTK_PROPAGATION_PHASE =
  sig
    datatype enum =
      NONE
    | CAPTURE
    | BUBBLE
    | TARGET
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
