signature GTK_RECENT_FILTER =
  sig
    type 'a class_t
    type recentfilterflags_t
    type recentfilterinforecord_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addAge :
      'a class_t
       -> LargeInt.int
       -> unit
    val addApplication :
      'a class_t
       -> string
       -> unit
    val addGroup :
      'a class_t
       -> string
       -> unit
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
       -> recentfilterinforecord_t
       -> bool
    val getName : 'a class_t -> string
    val getNeeded : 'a class_t -> recentfilterflags_t
    val setName :
      'a class_t
       -> string
       -> unit
  end
