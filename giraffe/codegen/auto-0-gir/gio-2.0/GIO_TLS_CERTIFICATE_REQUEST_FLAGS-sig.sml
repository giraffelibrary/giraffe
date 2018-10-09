signature GIO_TLS_CERTIFICATE_REQUEST_FLAGS =
  sig
    datatype enum =
      NONE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
