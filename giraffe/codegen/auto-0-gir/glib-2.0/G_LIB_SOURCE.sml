signature G_LIB_SOURCE =
  sig
    type record_t
    type maincontextrecord_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val addChildSource :
      record_t
       -> record_t
       -> unit
    val attach :
      record_t
       -> maincontextrecord_t
       -> LargeInt.int
    val destroy : record_t -> unit
    val getCanRecurse : record_t -> bool
    val getContext : record_t -> maincontextrecord_t
    val getId : record_t -> LargeInt.int
    val getName : record_t -> string
    val getPriority : record_t -> LargeInt.int
    val getTime : record_t -> LargeInt.int
    val isDestroyed : record_t -> bool
    val removeChildSource :
      record_t
       -> record_t
       -> unit
    val setCanRecurse :
      record_t
       -> bool
       -> unit
    val setName :
      record_t
       -> string
       -> unit
    val setPriority :
      record_t
       -> LargeInt.int
       -> unit
    val remove : LargeInt.int -> bool
    val setNameById :
      LargeInt.int
       -> string
       -> unit
  end
