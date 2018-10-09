signature VTE_PTY_ERROR =
  sig
    datatype enum =
      PTY_HELPER_FAILED
    | PTY_98_FAILED
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
