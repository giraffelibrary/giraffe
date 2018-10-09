signature GDK_STATUS =
  sig
    datatype enum =
      OK
    | ERROR
    | ERROR_PARAM
    | ERROR_FILE
    | ERROR_MEM
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
