signature GTK_SOURCE_COMPLETION_ERROR =
  sig
    datatype enum =
      ALREADY_BOUND
    | NOT_BOUND
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
