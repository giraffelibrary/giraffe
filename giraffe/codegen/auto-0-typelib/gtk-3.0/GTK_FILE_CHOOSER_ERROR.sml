signature GTK_FILE_CHOOSER_ERROR =
  sig
    datatype enum =
      NONEXISTENT
    | BAD_FILENAME
    | ALREADY_EXISTS
    | INCOMPLETE_HOSTNAME
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
