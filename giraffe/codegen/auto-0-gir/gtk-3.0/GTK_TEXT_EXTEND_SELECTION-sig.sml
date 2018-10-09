signature GTK_TEXT_EXTEND_SELECTION =
  sig
    datatype enum =
      WORD
    | LINE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
