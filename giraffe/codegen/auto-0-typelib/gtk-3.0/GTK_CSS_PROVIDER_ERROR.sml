signature GTK_CSS_PROVIDER_ERROR =
  sig
    datatype enum =
      FAILED
    | SYNTAX
    | IMPORT
    | NAME
    | DEPRECATED
    | UNKNOWN_VALUE
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
