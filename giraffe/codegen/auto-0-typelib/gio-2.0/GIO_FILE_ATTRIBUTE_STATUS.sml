signature GIO_FILE_ATTRIBUTE_STATUS =
  sig
    datatype enum =
      UNSET
    | SET
    | ERROR_SETTING
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
