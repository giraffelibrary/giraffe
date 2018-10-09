signature GTK_RECENT_CHOOSER_ERROR =
  sig
    datatype enum =
      NOT_FOUND
    | INVALID_URI
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
