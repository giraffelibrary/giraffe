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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_main_context_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libglib "g_main_context_new") (PolyMLFFI.cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val acquire_ = call (load_sym libglib "g_main_context_acquire") (GLibMainContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val addPoll_ =
        call (load_sym libglib "g_main_context_add_poll")
          (
            GLibMainContextRecord.PolyML.cPtr
             &&> GLibPollFDRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val dispatch_ = call (load_sym libglib "g_main_context_dispatch") (GLibMainContextRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val findSourceById_ = call (load_sym libglib "g_main_context_find_source_by_id") (GLibMainContextRecord.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val isOwner_ = call (load_sym libglib "g_main_context_is_owner") (GLibMainContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val iteration_ = call (load_sym libglib "g_main_context_iteration") (GLibMainContextRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val pending_ = call (load_sym libglib "g_main_context_pending") (GLibMainContextRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val popThreadDefault_ = call (load_sym libglib "g_main_context_pop_thread_default") (GLibMainContextRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val pushThreadDefault_ = call (load_sym libglib "g_main_context_push_thread_default") (GLibMainContextRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val query_ =
        call (load_sym libglib "g_main_context_query")
          (
            GLibMainContextRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GLibPollFDRecordCVectorN.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             --> GInt32.PolyML.cVal
          )
      val release_ = call (load_sym libglib "g_main_context_release") (GLibMainContextRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val removePoll_ = call (load_sym libglib "g_main_context_remove_poll") (GLibMainContextRecord.PolyML.cPtr &&> GLibPollFDRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val wait_ =
        call (load_sym libglib "g_main_context_wait")
          (
            GLibMainContextRecord.PolyML.cPtr
             &&> GLibCondRecord.PolyML.cPtr
             &&> GLibMutexRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val wakeup_ = call (load_sym libglib "g_main_context_wakeup") (GLibMainContextRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val default_ = call (load_sym libglib "g_main_context_default") (PolyMLFFI.cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val getThreadDefault_ = call (load_sym libglib "g_main_context_get_thread_default") (PolyMLFFI.cVoid --> GLibMainContextRecord.PolyML.cPtr)
    end
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
