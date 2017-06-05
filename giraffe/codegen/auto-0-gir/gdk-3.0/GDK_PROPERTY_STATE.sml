signature GDK_PROPERTY_STATE =
  sig
    datatype enum =
      NEW_VALUE
    | DELETE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
