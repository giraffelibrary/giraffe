signature GTK_PRINT_PAGES =
  sig
    datatype enum =
      ALL
    | CURRENT
    | RANGES
    | SELECTION
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
