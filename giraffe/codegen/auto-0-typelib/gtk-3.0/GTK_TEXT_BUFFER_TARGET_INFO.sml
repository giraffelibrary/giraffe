signature GTK_TEXT_BUFFER_TARGET_INFO =
  sig
    datatype enum =
      BUFFER_CONTENTS
    | RICH_TEXT
    | TEXT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
