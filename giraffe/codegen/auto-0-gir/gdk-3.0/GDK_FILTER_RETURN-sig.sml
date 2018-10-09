signature GDK_FILTER_RETURN =
  sig
    datatype enum =
      CONTINUE
    | TRANSLATE
    | REMOVE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
