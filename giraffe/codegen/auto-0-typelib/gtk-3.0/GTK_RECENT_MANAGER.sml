signature GTK_RECENT_MANAGER =
  sig
    type 'a class_t
    type recentdatarecord_t
    type recentinforecord_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getDefault : unit -> base class_t
    val addFull :
      'a class_t
       -> string
       -> recentdatarecord_t
       -> bool
    val addItem :
      'a class_t
       -> string
       -> bool
    val hasItem :
      'a class_t
       -> string
       -> bool
    val lookupItem :
      'a class_t
       -> string
       -> recentinforecord_t
    val moveItem :
      'a class_t
       -> string
       -> string option
       -> bool
    val purgeItems : 'a class_t -> LargeInt.int
    val removeItem :
      'a class_t
       -> string
       -> bool
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val filenameProp : ('a class_t, string option, string option) Property.readwrite
    val sizeProp : ('a class_t, LargeInt.int) Property.readonly
  end
