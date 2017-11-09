signature GTK_PAGE_ORIENTATION =
  sig
    datatype enum =
      PORTRAIT
    | LANDSCAPE
    | REVERSE_PORTRAIT
    | REVERSE_LANDSCAPE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
