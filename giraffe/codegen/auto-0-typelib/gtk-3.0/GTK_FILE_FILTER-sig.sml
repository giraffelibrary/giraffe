signature GTK_FILE_FILTER =
  sig
    type 'a class
    type 'a buildable_class
    type file_filter_flags_t
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newFromGvariant : GLib.VariantRecord.t -> base class
    val addMimeType :
      'a class
       -> string
       -> unit
    val addPattern :
      'a class
       -> string
       -> unit
    val addPixbufFormats : 'a class -> unit
    val getName : 'a class -> string option
    val getNeeded : 'a class -> file_filter_flags_t
    val setName :
      'a class
       -> string option
       -> unit
    val toGvariant : 'a class -> GLib.VariantRecord.t
  end
