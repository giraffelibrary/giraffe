signature ATK_LAYER =
  sig
    datatype enum =
      INVALID
    | BACKGROUND
    | CANVAS
    | WIDGET
    | MDI
    | POPUP
    | OVERLAY
    | WINDOW
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
