signature GIO_CREDENTIALS_TYPE =
  sig
    datatype enum =
      INVALID
    | LINUX_UCRED
    | FREEBSD_CMSGCRED
    | OPENBSD_SOCKPEERCRED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
