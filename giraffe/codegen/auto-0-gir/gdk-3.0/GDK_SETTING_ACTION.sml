signature GDK_SETTING_ACTION =
  sig
    datatype enum =
      NEW
    | CHANGED
    | DELETED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
