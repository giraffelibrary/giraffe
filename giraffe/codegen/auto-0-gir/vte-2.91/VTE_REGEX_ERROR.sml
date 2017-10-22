signature VTE_REGEX_ERROR =
  sig
    datatype enum =
      INCOMPATIBLE
    | NOT_SUPPORTED
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
