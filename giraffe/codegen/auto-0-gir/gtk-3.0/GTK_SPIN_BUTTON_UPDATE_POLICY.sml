signature GTK_SPIN_BUTTON_UPDATE_POLICY =
  sig
    datatype enum =
      ALWAYS
    | IF_VALID
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
