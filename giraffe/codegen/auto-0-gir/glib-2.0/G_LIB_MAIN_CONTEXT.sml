signature G_LIB_MAIN_CONTEXT =
  sig
    type t
    type source_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val acquire : t -> bool
    val dispatch : t -> unit
    val findSourceById :
      t
       -> LargeInt.int
       -> source_t
    val isOwner : t -> bool
    val iteration :
      t
       -> bool
       -> bool
    val pending : t -> bool
    val popThreadDefault : t -> unit
    val pushThreadDefault : t -> unit
    val release : t -> unit
    val wakeup : t -> unit
    val default : unit -> t
    val getThreadDefault : unit -> t
  end
