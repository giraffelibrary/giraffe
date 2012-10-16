signature G_OBJECT_OBJECT =
  sig
    type 'a class_t
    type 'a paramspecclass_t
    type closurerecord_t
    type valuerecord_t
    type bindingflags_t
    type 'a bindingclass_t
    type type_t
    val getType : unit -> type_t
    val bindProperty :
      string
       -> string
       -> bindingflags_t
       -> base bindingclass_t
    val bindPropertyFull :
      string
       -> string
       -> bindingflags_t
       -> closurerecord_t
       -> closurerecord_t
       -> base bindingclass_t
    val compatControl : LargeInt.int -> LargeInt.int
    val interfaceFindProperty : string -> base paramspecclass_t
    val interfaceInstallProperty : 'a paramspecclass_t -> unit
    val forceFloating : 'a class_t -> unit
    val freezeNotify : 'a class_t -> unit
    val getData :
      'a class_t
       -> string
       -> unit
    val getProperty :
      'a class_t
       -> string
       -> valuerecord_t
       -> unit
    val getQdata :
      'a class_t
       -> LargeInt.int
       -> unit
    val isFloating : 'a class_t -> bool
    val notify :
      'a class_t
       -> string
       -> unit
    val notifyByPspec :
      'a class_t
       -> 'b paramspecclass_t
       -> unit
    val runDispose : 'a class_t -> unit
    val setData :
      'a class_t
       -> string
       -> unit
    val setProperty :
      'a class_t
       -> string
       -> valuerecord_t
       -> unit
    val stealData :
      'a class_t
       -> string
       -> unit
    val stealQdata :
      'a class_t
       -> LargeInt.int
       -> unit
    val thawNotify : 'a class_t -> unit
    val watchClosure :
      'a class_t
       -> closurerecord_t
       -> unit
    val notifySig : (base paramspecclass_t -> unit) -> 'a class_t Signal.signal
  end
