signature GTK_SOURCE_NEWLINE_TYPE =
  sig
    datatype enum =
      LF
    | CR
    | CR_LF
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
