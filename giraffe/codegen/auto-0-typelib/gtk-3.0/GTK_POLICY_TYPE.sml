signature GTK_POLICY_TYPE =
  sig
    datatype enum =
      ALWAYS
    | AUTOMATIC
    | NEVER
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
