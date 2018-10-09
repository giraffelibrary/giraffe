signature GTK_BUILDER_ERROR =
  sig
    datatype enum =
      INVALID_TYPE_FUNCTION
    | UNHANDLED_TAG
    | MISSING_ATTRIBUTE
    | INVALID_ATTRIBUTE
    | INVALID_TAG
    | MISSING_PROPERTY_VALUE
    | INVALID_VALUE
    | VERSION_MISMATCH
    | DUPLICATE_ID
    | OBJECT_TYPE_REFUSED
    | TEMPLATE_MISMATCH
    | INVALID_PROPERTY
    | INVALID_SIGNAL
    | INVALID_ID
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
