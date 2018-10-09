signature GTK_RECENT_FILTER =
  sig
    type 'a class
    type 'a buildable_class
    type recent_filter_info_t
    type recent_filter_flags_t
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addAge :
      'a class
       -> LargeInt.int
       -> unit
    val addApplication :
      'a class
       -> string
       -> unit
    val addGroup :
      'a class
       -> string
       -> unit
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
       -> recent_filter_info_t
       -> bool
    val getName : 'a class -> string option
    val getNeeded : 'a class -> recent_filter_flags_t
    val setName :
      'a class
       -> string
       -> unit
  end
