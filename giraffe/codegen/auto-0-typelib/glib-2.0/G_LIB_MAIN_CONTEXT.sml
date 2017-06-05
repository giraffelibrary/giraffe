signature G_LIB_MAIN_CONTEXT =
  sig
    type t
    type source_t
    type poll_f_d_t
    type mutex_t
    type cond_t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val acquire : t -> bool
    val addPoll :
      t
       -> poll_f_d_t
       -> LargeInt.int
       -> unit
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
    val query :
      t
       -> LargeInt.int
       -> LargeInt.int
           * LargeInt.int
           * poll_f_d_t vector
    val release : t -> unit
    val removePoll :
      t
       -> poll_f_d_t
       -> unit
    val wait :
      t
       -> cond_t
       -> mutex_t
       -> bool
    val wakeup : t -> unit
    val default : unit -> t
    val getThreadDefault : unit -> t
  end
