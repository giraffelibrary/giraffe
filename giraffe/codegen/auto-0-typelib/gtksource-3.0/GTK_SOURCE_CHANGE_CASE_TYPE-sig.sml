signature GTK_SOURCE_CHANGE_CASE_TYPE =
  sig
    datatype enum =
      LOWER
    | UPPER
    | TOGGLE
    | TITLE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
