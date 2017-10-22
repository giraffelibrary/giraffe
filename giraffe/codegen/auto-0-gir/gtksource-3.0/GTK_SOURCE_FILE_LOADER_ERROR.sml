signature GTK_SOURCE_FILE_LOADER_ERROR =
  sig
    datatype enum =
      TOO_BIG
    | ENCODING_AUTO_DETECTION_FAILED
    | CONVERSION_FALLBACK
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
