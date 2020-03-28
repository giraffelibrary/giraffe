signature GTK_BUTTONS_TYPE =
  sig
    datatype enum =
      NONE
    | OK
    | CLOSE
    | CANCEL
    | YES_NO
    | OK_CANCEL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end