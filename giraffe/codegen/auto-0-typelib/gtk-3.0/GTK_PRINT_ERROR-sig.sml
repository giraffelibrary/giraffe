signature GTK_PRINT_ERROR =
  sig
    datatype enum =
      GENERAL
    | INTERNAL_ERROR
    | NOMEM
    | INVALID_FILE
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
