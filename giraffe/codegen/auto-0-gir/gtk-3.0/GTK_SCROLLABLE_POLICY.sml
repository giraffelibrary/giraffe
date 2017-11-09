signature GTK_SCROLLABLE_POLICY =
  sig
    datatype enum =
      MINIMUM
    | NATURAL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
