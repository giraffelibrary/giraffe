signature GTK_FILE_FILTER =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type file_filter_info_record_t
    type file_filter_flags_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addMimeType :
      'a class_t
       -> string
       -> unit
    val addPattern :
      'a class_t
       -> string
       -> unit
    val addPixbufFormats : 'a class_t -> unit
    val filter :
      'a class_t
       -> file_filter_info_record_t
       -> bool
    val getName : 'a class_t -> string
    val getNeeded : 'a class_t -> file_filter_flags_t
    val setName :
      'a class_t
       -> string option
       -> unit
  end
