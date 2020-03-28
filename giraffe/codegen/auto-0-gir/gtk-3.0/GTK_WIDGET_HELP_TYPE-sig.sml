signature GTK_WIDGET_HELP_TYPE =
  sig
    datatype enum =
      TOOLTIP
    | WHATS_THIS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end