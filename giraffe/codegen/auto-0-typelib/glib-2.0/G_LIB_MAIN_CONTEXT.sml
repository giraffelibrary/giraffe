signature G_LIB_MAIN_CONTEXT =
  sig
    type record_t
    type source_record_t
    type poll_f_d_record_t
    type mutex_record_t
    type cond_record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val acquire : record_t -> bool
    val addPoll :
      record_t
       -> poll_f_d_record_t
       -> LargeInt.int
       -> unit
    val dispatch : record_t -> unit
    val findSourceById :
      record_t
       -> LargeInt.int
       -> source_record_t
    val isOwner : record_t -> bool
    val iteration :
      record_t
       -> bool
       -> bool
    val pending : record_t -> bool
    val popThreadDefault : record_t -> unit
    val pushThreadDefault : record_t -> unit
    val release : record_t -> unit
    val removePoll :
      record_t
       -> poll_f_d_record_t
       -> unit
    val wait :
      record_t
       -> cond_record_t
       -> mutex_record_t
       -> bool
    val wakeup : record_t -> unit
    val default : unit -> record_t
    val getThreadDefault : unit -> record_t
  end
