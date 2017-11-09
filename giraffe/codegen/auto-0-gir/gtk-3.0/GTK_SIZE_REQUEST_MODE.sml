signature GTK_SIZE_REQUEST_MODE =
  sig
    datatype enum =
      HEIGHT_FOR_WIDTH
    | WIDTH_FOR_HEIGHT
    | CONSTANT_SIZE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
