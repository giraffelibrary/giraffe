structure GLibMainContext :>
  G_LIB_MAIN_CONTEXT
    where type t = GLibMainContextRecord.t
    where type source_t = GLibSourceRecord.t
    where type poll_f_d_t = GLibPollFDRecord.t
    where type mutex_t = GLibMutexRecord.t
    where type cond_t = GLibCondRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_main_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libglib "g_main_context_new") (FFI.PolyML.cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val acquire_ = call (load_sym libglib "g_main_context_acquire") (GLibMainContextRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val addPoll_ =
        call (load_sym libglib "g_main_context_add_poll")
          (
            GLibMainContextRecord.PolyML.cPtr
             &&> GLibPollFDRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val dispatch_ = call (load_sym libglib "g_main_context_dispatch") (GLibMainContextRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val findSourceById_ = call (load_sym libglib "g_main_context_find_source_by_id") (GLibMainContextRecord.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> GLibSourceRecord.PolyML.cPtr)
      val isOwner_ = call (load_sym libglib "g_main_context_is_owner") (GLibMainContextRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val iteration_ = call (load_sym libglib "g_main_context_iteration") (GLibMainContextRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val pending_ = call (load_sym libglib "g_main_context_pending") (GLibMainContextRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val popThreadDefault_ = call (load_sym libglib "g_main_context_pop_thread_default") (GLibMainContextRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val pushThreadDefault_ = call (load_sym libglib "g_main_context_push_thread_default") (GLibMainContextRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val release_ = call (load_sym libglib "g_main_context_release") (GLibMainContextRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val removePoll_ = call (load_sym libglib "g_main_context_remove_poll") (GLibMainContextRecord.PolyML.cPtr &&> GLibPollFDRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val wait_ =
        call (load_sym libglib "g_main_context_wait")
          (
            GLibMainContextRecord.PolyML.cPtr
             &&> GLibCondRecord.PolyML.cPtr
             &&> GLibMutexRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val wakeup_ = call (load_sym libglib "g_main_context_wakeup") (GLibMainContextRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val default_ = call (load_sym libglib "g_main_context_default") (FFI.PolyML.cVoid --> GLibMainContextRecord.PolyML.cPtr)
      val getThreadDefault_ = call (load_sym libglib "g_main_context_get_thread_default") (FFI.PolyML.cVoid --> GLibMainContextRecord.PolyML.cPtr)
    end
    type t = GLibMainContextRecord.t
    type source_t = GLibSourceRecord.t
    type poll_f_d_t = GLibPollFDRecord.t
    type mutex_t = GLibMutexRecord.t
    type cond_t = GLibCondRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GLibMainContextRecord.C.fromPtr true) new_ ()
    fun acquire self = (GLibMainContextRecord.C.withPtr ---> FFI.Bool.C.fromVal) acquire_ self
    fun addPoll self fd priority =
      (
        GLibMainContextRecord.C.withPtr
         &&&> GLibPollFDRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        addPoll_
        (
          self
           & fd
           & priority
        )
    fun dispatch self = (GLibMainContextRecord.C.withPtr ---> I) dispatch_ self
    fun findSourceById self sourceId = (GLibMainContextRecord.C.withPtr &&&> FFI.UInt32.C.withVal ---> GLibSourceRecord.C.fromPtr false) findSourceById_ (self & sourceId)
    fun isOwner self = (GLibMainContextRecord.C.withPtr ---> FFI.Bool.C.fromVal) isOwner_ self
    fun iteration self mayBlock = (GLibMainContextRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) iteration_ (self & mayBlock)
    fun pending self = (GLibMainContextRecord.C.withPtr ---> FFI.Bool.C.fromVal) pending_ self
    fun popThreadDefault self = (GLibMainContextRecord.C.withPtr ---> I) popThreadDefault_ self
    fun pushThreadDefault self = (GLibMainContextRecord.C.withPtr ---> I) pushThreadDefault_ self
    fun release self = (GLibMainContextRecord.C.withPtr ---> I) release_ self
    fun removePoll self fd = (GLibMainContextRecord.C.withPtr &&&> GLibPollFDRecord.C.withPtr ---> I) removePoll_ (self & fd)
    fun wait self cond mutex =
      (
        GLibMainContextRecord.C.withPtr
         &&&> GLibCondRecord.C.withPtr
         &&&> GLibMutexRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
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
