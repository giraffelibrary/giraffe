signature GTK_ENTRY_ICON_POSITION =
  sig
    datatype enum =
      PRIMARY
    | SECONDARY
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
