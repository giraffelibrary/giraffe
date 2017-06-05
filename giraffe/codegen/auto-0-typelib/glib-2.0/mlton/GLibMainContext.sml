structure GLibMainContext :>
  G_LIB_MAIN_CONTEXT
    where type t = GLibMainContextRecord.t
    where type source_t = GLibSourceRecord.t
    where type poll_f_d_t = GLibPollFDRecord.t
    where type mutex_t = GLibMutexRecord.t
    where type cond_t = GLibCondRecord.t =
  struct
    structure GLibPollFDRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GLibPollFDRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GLibPollFDRecordCVectorN = CVectorN(GLibPollFDRecordCVectorNType)
    val getType_ = _import "g_main_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_main_context_new" : unit -> GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p;
    val acquire_ = _import "g_main_context_acquire" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> GBool.FFI.val_;
    val addPoll_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_main_context_add_poll" :
              GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p
               * GLibPollFDRecord.FFI.notnull GLibPollFDRecord.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val dispatch_ = _import "g_main_context_dispatch" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val findSourceById_ = fn x1 & x2 => (_import "g_main_context_find_source_by_id" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p * GUInt32.FFI.val_ -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;) (x1, x2)
    val isOwner_ = _import "g_main_context_is_owner" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> GBool.FFI.val_;
    val iteration_ = fn x1 & x2 => (_import "g_main_context_iteration" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val pending_ = _import "g_main_context_pending" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> GBool.FFI.val_;
    val popThreadDefault_ = _import "g_main_context_pop_thread_default" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val pushThreadDefault_ = _import "g_main_context_push_thread_default" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val query_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_main_context_query" :
              GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GLibPollFDRecordCVectorN.MLton.r1
               * (unit, GLibPollFDRecordCVectorN.FFI.notnull) GLibPollFDRecordCVectorN.MLton.r2
               * GInt32.FFI.ref_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val release_ = _import "g_main_context_release" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val removePoll_ = fn x1 & x2 => (_import "g_main_context_remove_poll" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p * GLibPollFDRecord.FFI.notnull GLibPollFDRecord.FFI.p -> unit;) (x1, x2)
    val wait_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_main_context_wait" :
              GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p
               * GLibCondRecord.FFI.notnull GLibCondRecord.FFI.p
               * GLibMutexRecord.FFI.notnull GLibMutexRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val wakeup_ = _import "g_main_context_wakeup" : GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p -> unit;
    val default_ = _import "g_main_context_default" : unit -> GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p;
    val getThreadDefault_ = _import "g_main_context_get_thread_default" : unit -> GLibMainContextRecord.FFI.notnull GLibMainContextRecord.FFI.p;
    type t = GLibMainContextRecord.t
    type source_t = GLibSourceRecord.t
    type poll_f_d_t = GLibPollFDRecord.t
    type mutex_t = GLibMutexRecord.t
    type cond_t = GLibCondRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GLibMainContextRecord.FFI.fromPtr true) new_ ()
    fun acquire self = (GLibMainContextRecord.FFI.withPtr ---> GBool.FFI.fromVal) acquire_ self
    fun addPoll self fd priority =
      (
        GLibMainContextRecord.FFI.withPtr
         &&&> GLibPollFDRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        addPoll_
        (
          self
           & fd
           & priority
        )
    fun dispatch self = (GLibMainContextRecord.FFI.withPtr ---> I) dispatch_ self
    fun findSourceById self sourceId = (GLibMainContextRecord.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GLibSourceRecord.FFI.fromPtr false) findSourceById_ (self & sourceId)
    fun isOwner self = (GLibMainContextRecord.FFI.withPtr ---> GBool.FFI.fromVal) isOwner_ self
    fun iteration self mayBlock = (GLibMainContextRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) iteration_ (self & mayBlock)
    fun pending self = (GLibMainContextRecord.FFI.withPtr ---> GBool.FFI.fromVal) pending_ self
    fun popThreadDefault self = (GLibMainContextRecord.FFI.withPtr ---> I) popThreadDefault_ self
    fun pushThreadDefault self = (GLibMainContextRecord.FFI.withPtr ---> I) pushThreadDefault_ self
    fun query self maxPriority =
      let
        val timeout
         & fds
         & nFds
         & retVal =
          (
            GLibMainContextRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GLibPollFDRecordCVectorN.FFI.withRefOptPtr
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GLibPollFDRecordCVectorN.FFI.fromPtr 0
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
          )
            query_
            (
              self
               & maxPriority
               & GInt32.null
               & NONE
               & GInt32.null
            )
      in
        (
          retVal,
          timeout,
          fds (LargeInt.toInt nFds)
        )
      end
    fun release self = (GLibMainContextRecord.FFI.withPtr ---> I) release_ self
    fun removePoll self fd = (GLibMainContextRecord.FFI.withPtr &&&> GLibPollFDRecord.FFI.withPtr ---> I) removePoll_ (self & fd)
    fun wait self cond mutex =
      (
        GLibMainContextRecord.FFI.withPtr
         &&&> GLibCondRecord.FFI.withPtr
         &&&> GLibMutexRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        wait_
        (
          self
           & cond
           & mutex
        )
    fun wakeup self = (GLibMainContextRecord.FFI.withPtr ---> I) wakeup_ self
    fun default () = (I ---> GLibMainContextRecord.FFI.fromPtr false) default_ ()
    fun getThreadDefault () = (I ---> GLibMainContextRecord.FFI.fromPtr false) getThreadDefault_ ()
  end
