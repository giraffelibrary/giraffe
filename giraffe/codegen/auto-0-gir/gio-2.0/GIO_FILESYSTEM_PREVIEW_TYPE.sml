signature GIO_FILESYSTEM_PREVIEW_TYPE =
  sig
    datatype enum =
      IF_ALWAYS
    | IF_LOCAL
    | NEVER
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
