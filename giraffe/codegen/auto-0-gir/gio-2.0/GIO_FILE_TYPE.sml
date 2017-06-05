signature GIO_FILE_TYPE =
  sig
    datatype enum =
      UNKNOWN
    | REGULAR
    | DIRECTORY
    | SYMBOLIC_LINK
    | SPECIAL
    | SHORTCUT
    | MOUNTABLE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
