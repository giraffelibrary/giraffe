signature GDK_GRAB_OWNERSHIP =
  sig
    datatype enum =
      NONE
    | WINDOW
    | APPLICATION
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
