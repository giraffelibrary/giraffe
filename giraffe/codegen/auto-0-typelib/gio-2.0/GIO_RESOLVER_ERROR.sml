signature GIO_RESOLVER_ERROR =
  sig
    datatype enum =
      NOT_FOUND
    | TEMPORARY_FAILURE
    | INTERNAL
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
