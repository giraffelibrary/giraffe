signature GDK_VISIBILITY_STATE =
  sig
    datatype enum =
      UNOBSCURED
    | PARTIAL
    | FULLY_OBSCURED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
