signature GIO_TLS_ERROR =
  sig
    datatype enum =
      UNAVAILABLE
    | MISC
    | BAD_CERTIFICATE
    | NOT_TLS
    | HANDSHAKE
    | CERTIFICATE_REQUIRED
    | EOF
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
