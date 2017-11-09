signature GTK_RECENT_SORT_TYPE =
  sig
    datatype enum =
      NONE
    | MRU
    | LRU
    | CUSTOM
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
