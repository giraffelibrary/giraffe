signature GIO_RESOURCE =
  sig
    type t
    type 'a input_stream_class
    type resource_lookup_flags_t
    val getType : unit -> GObject.Type.t
    val newFromData : GLib.BytesRecord.t -> t
    val enumerateChildren :
      t
       -> string * resource_lookup_flags_t
       -> Utf8CPtrArray.t
    val getInfo :
      t
       -> string * resource_lookup_flags_t
       -> int * LargeInt.int
    val lookupData :
      t
       -> string * resource_lookup_flags_t
       -> GLib.BytesRecord.t
    val openStream :
      t
       -> string * resource_lookup_flags_t
       -> base input_stream_class
    val load : string -> t
  end
