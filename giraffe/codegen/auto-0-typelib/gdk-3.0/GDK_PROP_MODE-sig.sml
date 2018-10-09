signature GDK_PROP_MODE =
  sig
    datatype enum =
      REPLACE
    | PREPEND
    | APPEND
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
