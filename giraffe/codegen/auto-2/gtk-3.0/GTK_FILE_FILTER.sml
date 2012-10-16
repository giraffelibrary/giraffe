signature GTK_FILE_FILTER =
  sig
    type 'a class_t
    type filefilterflags_t
    type filefilterinforecord_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
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
       -> filefilterinforecord_t
       -> bool
    val getName : 'a class_t -> string
    val getNeeded : 'a class_t -> filefilterflags_t
    val setName :
      'a class_t
       -> string option
       -> unit
  end
