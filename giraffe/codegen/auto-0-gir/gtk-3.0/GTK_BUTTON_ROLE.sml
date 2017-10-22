signature GTK_BUTTON_ROLE =
  sig
    datatype enum =
      NORMAL
    | CHECK
    | RADIO
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
