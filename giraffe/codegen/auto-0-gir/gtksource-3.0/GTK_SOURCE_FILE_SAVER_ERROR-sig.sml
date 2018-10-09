signature GTK_SOURCE_FILE_SAVER_ERROR =
  sig
    datatype enum =
      INVALID_CHARS
    | EXTERNALLY_MODIFIED
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
