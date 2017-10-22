signature GTK_POLICY_TYPE =
  sig
    datatype enum =
      ALWAYS
    | AUTOMATIC
    | NEVER
    | EXTERNAL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
