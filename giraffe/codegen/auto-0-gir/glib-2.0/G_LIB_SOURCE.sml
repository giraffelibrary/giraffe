signature G_LIB_SOURCE =
  sig
    type t
    type main_context_t
    type time_val_t
    val getType : unit -> GObject.Type.t
    val addChildSource :
      t
       -> t
       -> unit
    val attach :
      t
       -> main_context_t option
       -> LargeInt.int
    val destroy : t -> unit
    val getCanRecurse : t -> bool
    val getContext : t -> main_context_t
    val getCurrentTime :
      t
       -> time_val_t
       -> unit
    val getId : t -> LargeInt.int
    val getName : t -> string
    val getPriority : t -> LargeInt.int
    val getReadyTime : t -> LargeInt.int
    val getTime : t -> LargeInt.int
    val isDestroyed : t -> bool
    val removeChildSource :
      t
       -> t
       -> unit
    val setCanRecurse :
      t
       -> bool
       -> unit
    val setName :
      t
       -> string
       -> unit
    val setPriority :
      t
       -> LargeInt.int
       -> unit
    val setReadyTime :
      t
       -> LargeInt.int
       -> unit
    val remove : LargeInt.int -> bool
    val setNameById : LargeInt.int * string -> unit
  end
