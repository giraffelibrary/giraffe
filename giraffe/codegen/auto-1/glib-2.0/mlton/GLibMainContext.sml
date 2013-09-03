structure GLibMainContext :>
  G_LIB_MAIN_CONTEXT
    where type record_t = GLibMainContextRecord.t
    where type sourcefuncsrecord_t = GLibSourceFuncsRecord.t
    where type sourcerecord_t = GLibSourceRecord.t
    where type pollfdrecord_t = GLibPollFDRecord.t
    where type mutexrecord_t = GLibMutexRecord.t
    where type condrecord_t = GLibCondRecord.t =
  struct
    val getType_ = _import "g_main_context_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_main_context_new" : unit -> GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p;
    val acquire_ = _import "g_main_context_acquire" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> FFI.Bool.val_;
    val addPoll_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_main_context_add_poll" :
              GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p
               * GLibPollFDRecord.C.notnull GLibPollFDRecord.C.p
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val dispatch_ = _import "g_main_context_dispatch" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> unit;
    val findSourceByFuncsUserData_ = fn x1 & x2 => (_import "g_main_context_find_source_by_funcs_user_data" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p * GLibSourceFuncsRecord.C.notnull GLibSourceFuncsRecord.C.p -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;) (x1, x2)
    val findSourceById_ = fn x1 & x2 => (_import "g_main_context_find_source_by_id" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p * FFI.UInt32.val_ -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;) (x1, x2)
    val findSourceByUserData_ = _import "g_main_context_find_source_by_user_data" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> GLibSourceRecord.C.notnull GLibSourceRecord.C.p;
    val isOwner_ = _import "g_main_context_is_owner" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> FFI.Bool.val_;
    val iteration_ = fn x1 & x2 => (_import "g_main_context_iteration" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p * FFI.Bool.val_ -> FFI.Bool.val_;) (x1, x2)
    val pending_ = _import "g_main_context_pending" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> FFI.Bool.val_;
    val popThreadDefault_ = _import "g_main_context_pop_thread_default" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> unit;
    val pushThreadDefault_ = _import "g_main_context_push_thread_default" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> unit;
    val release_ = _import "g_main_context_release" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> unit;
    val removePoll_ = fn x1 & x2 => (_import "g_main_context_remove_poll" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p * GLibPollFDRecord.C.notnull GLibPollFDRecord.C.p -> unit;) (x1, x2)
    val wait_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_main_context_wait" :
              GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p
               * GLibCondRecord.C.notnull GLibCondRecord.C.p
               * GLibMutexRecord.C.notnull GLibMutexRecord.C.p
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val wakeup_ = _import "g_main_context_wakeup" : GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p -> unit;
    val default_ = _import "g_main_context_default" : unit -> GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p;
    val getThreadDefault_ = _import "g_main_context_get_thread_default" : unit -> GLibMainContextRecord.C.notnull GLibMainContextRecord.C.p;
    type record_t = GLibMainContextRecord.t
    type sourcefuncsrecord_t = GLibSourceFuncsRecord.t
    type sourcerecord_t = GLibSourceRecord.t
    type pollfdrecord_t = GLibPollFDRecord.t
    type mutexrecord_t = GLibMutexRecord.t
    type condrecord_t = GLibCondRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GLibMainContextRecord.C.fromPtr true) new_ ()
    fun acquire self = (GLibMainContextRecord.C.withPtr ---> FFI.Bool.fromVal) acquire_ self
    fun addPoll self fd priority =
      (
        GLibMainContextRecord.C.withPtr
         &&&> GLibPollFDRecord.C.withPtr
         &&&> FFI.Int32.withVal
         ---> I
      )
        addPoll_
        (
          self
           & fd
           & priority
        )
    fun dispatch self = (GLibMainContextRecord.C.withPtr ---> I) dispatch_ self
    fun findSourceByFuncsUserData self funcs = (GLibMainContextRecord.C.withPtr &&&> GLibSourceFuncsRecord.C.withPtr ---> GLibSourceRecord.C.fromPtr false) findSourceByFuncsUserData_ (self & funcs)
    fun findSourceById self sourceId = (GLibMainContextRecord.C.withPtr &&&> FFI.UInt32.withVal ---> GLibSourceRecord.C.fromPtr false) findSourceById_ (self & sourceId)
    fun findSourceByUserData self = (GLibMainContextRecord.C.withPtr ---> GLibSourceRecord.C.fromPtr false) findSourceByUserData_ self
    fun isOwner self = (GLibMainContextRecord.C.withPtr ---> FFI.Bool.fromVal) isOwner_ self
    fun iteration self mayBlock = (GLibMainContextRecord.C.withPtr &&&> FFI.Bool.withVal ---> FFI.Bool.fromVal) iteration_ (self & mayBlock)
    fun pending self = (GLibMainContextRecord.C.withPtr ---> FFI.Bool.fromVal) pending_ self
    fun popThreadDefault self = (GLibMainContextRecord.C.withPtr ---> I) popThreadDefault_ self
    fun pushThreadDefault self = (GLibMainContextRecord.C.withPtr ---> I) pushThreadDefault_ self
    fun release self = (GLibMainContextRecord.C.withPtr ---> I) release_ self
    fun removePoll self fd = (GLibMainContextRecord.C.withPtr &&&> GLibPollFDRecord.C.withPtr ---> I) removePoll_ (self & fd)
    fun wait self cond mutex =
      (
        GLibMainContextRecord.C.withPtr
         &&&> GLibCondRecord.C.withPtr
         &&&> GLibMutexRecord.C.withPtr
         ---> FFI.Bool.fromVal
      )
        wait_
        (
          self
           & cond
           & mutex
        )
    fun wakeup self = (GLibMainContextRecord.C.withPtr ---> I) wakeup_ self
    fun default () = (I ---> GLibMainContextRecord.C.fromPtr false) default_ ()
    fun getThreadDefault () = (I ---> GLibMainContextRecord.C.fromPtr false) getThreadDefault_ ()
  end
