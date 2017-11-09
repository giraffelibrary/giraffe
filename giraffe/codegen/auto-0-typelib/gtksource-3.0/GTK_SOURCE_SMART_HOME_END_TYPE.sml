signature GTK_SOURCE_SMART_HOME_END_TYPE =
  sig
    datatype enum =
      DISABLED
    | BEFORE
    | AFTER
    | ALWAYS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
