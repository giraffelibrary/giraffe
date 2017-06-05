signature GTK_PRINT_DUPLEX =
  sig
    datatype enum =
      SIMPLEX
    | HORIZONTAL
    | VERTICAL
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
