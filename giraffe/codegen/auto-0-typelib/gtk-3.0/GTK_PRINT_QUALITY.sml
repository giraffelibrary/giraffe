signature GTK_PRINT_QUALITY =
  sig
    datatype enum =
      LOW
    | NORMAL
    | HIGH
    | DRAFT
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
