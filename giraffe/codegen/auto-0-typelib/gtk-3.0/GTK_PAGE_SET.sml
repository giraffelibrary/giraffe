signature GTK_PAGE_SET =
  sig
    datatype enum =
      ALL
    | EVEN
    | ODD
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
