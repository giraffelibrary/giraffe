signature GTK_RECENT_MANAGER =
  sig
    type 'a class
    type recent_data_t
    type recent_info_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getDefault : unit -> base class
    val addFull :
      'a class
       -> string * recent_data_t
       -> bool
    val addItem :
      'a class
       -> string
       -> bool
    val hasItem :
      'a class
       -> string
       -> bool
    val lookupItem :
      'a class
       -> string
       -> recent_info_t option
    val moveItem :
      'a class
       -> string * string option
       -> unit
    val purgeItems : 'a class -> LargeInt.int
    val removeItem :
      'a class
       -> string
       -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.t
    val filenameProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val sizeProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
  end
