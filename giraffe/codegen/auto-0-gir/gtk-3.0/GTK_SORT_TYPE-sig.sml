signature GTK_SORT_TYPE =
  sig
    datatype enum =
      ASCENDING
    | DESCENDING
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
