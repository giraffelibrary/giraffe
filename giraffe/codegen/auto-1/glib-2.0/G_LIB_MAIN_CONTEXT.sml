signature G_LIB_MAIN_CONTEXT =
  sig
    type record_t
    type condrecord_t
    type mutexrecord_t
    type pollfdrecord_t
    type sourcerecord_t
    type sourcefuncsrecord_t
    val getType : unit -> GObject.Type.t
    val new : unit -> record_t
    val acquire : record_t -> bool
    val addPoll :
      record_t
       -> pollfdrecord_t
       -> LargeInt.int
       -> unit
    val dispatch : record_t -> unit
    val findSourceByFuncsUserData :
      record_t
       -> sourcefuncsrecord_t
       -> sourcerecord_t
    val findSourceById :
      record_t
       -> LargeInt.int
       -> sourcerecord_t
    val findSourceByUserData : record_t -> sourcerecord_t
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
       -> pollfdrecord_t
       -> unit
    val wait :
      record_t
       -> condrecord_t
       -> mutexrecord_t
       -> bool
    val wakeup : record_t -> unit
    val default : unit -> record_t
    val getThreadDefault : unit -> record_t
  end
