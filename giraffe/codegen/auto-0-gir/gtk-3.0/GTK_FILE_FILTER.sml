signature GTK_FILE_FILTER =
  sig
    type 'a class
    type 'a buildable_class
    type file_filter_info_t
    type file_filter_flags_t
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addMimeType :
      'a class
       -> string
       -> unit
    val addPattern :
      'a class
       -> string
       -> unit
    val addPixbufFormats : 'a class -> unit
    val filter :
      'a class
       -> file_filter_info_t
       -> bool
    val getName : 'a class -> string
    val getNeeded : 'a class -> file_filter_flags_t
    val setName :
      'a class
       -> string option
       -> unit
  end
