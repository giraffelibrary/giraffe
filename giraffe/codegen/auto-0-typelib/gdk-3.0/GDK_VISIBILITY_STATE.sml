signature GDK_VISIBILITY_STATE =
  sig
    datatype enum =
      UNOBSCURED
    | PARTIAL
    | FULLY_OBSCURED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
