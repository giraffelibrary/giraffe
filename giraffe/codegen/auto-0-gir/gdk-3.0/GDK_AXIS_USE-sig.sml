signature GDK_AXIS_USE =
  sig
    datatype enum =
      IGNORE
    | X
    | Y
    | PRESSURE
    | XTILT
    | YTILT
    | WHEEL
    | DISTANCE
    | ROTATION
    | SLIDER
    | LAST
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
