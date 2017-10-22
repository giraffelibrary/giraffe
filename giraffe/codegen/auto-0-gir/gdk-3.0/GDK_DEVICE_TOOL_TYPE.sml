signature GDK_DEVICE_TOOL_TYPE =
  sig
    datatype enum =
      UNKNOWN
    | PEN
    | ERASER
    | BRUSH
    | PENCIL
    | AIRBRUSH
    | MOUSE
    | LENS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
