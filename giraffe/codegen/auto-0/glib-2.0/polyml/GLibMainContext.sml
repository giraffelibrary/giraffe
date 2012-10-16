structure GLibMainContext :>
  G_LIB_MAIN_CONTEXT
    where type record_t = GLibMainContextRecord.t
    where type sourcefuncsrecord_t = GLibSourceFuncsRecord.t
    where type sourcerecord_t = GLibSourceRecord.t
    where type pollfdrecord_t = GLibPollFDRecord.t
    where type mutexrecord_t = GLibMutexRecord.t
    where type condrecord_t = GLibCondRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_main_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libglib "g_main_context_new") (FFI.PolyML.VOID --> GLibMainContextRecord.PolyML.PTR)
      val acquire_ = call (load_sym libglib "g_main_context_acquire") (GLibMainContextRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val addPoll_ =
        call (load_sym libglib "g_main_context_add_poll")
          (
            GLibMainContextRecord.PolyML.PTR
             &&> GLibPollFDRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val dispatch_ = call (load_sym libglib "g_main_context_dispatch") (GLibMainContextRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val findSourceByFuncsUserData_ = call (load_sym libglib "g_main_context_find_source_by_funcs_user_data") (GLibMainContextRecord.PolyML.PTR &&> GLibSourceFuncsRecord.PolyML.PTR --> GLibSourceRecord.PolyML.PTR)
      val findSourceById_ = call (load_sym libglib "g_main_context_find_source_by_id") (GLibMainContextRecord.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> GLibSourceRecord.PolyML.PTR)
      val findSourceByUserData_ = call (load_sym libglib "g_main_context_find_source_by_user_data") (GLibMainContextRecord.PolyML.PTR --> GLibSourceRecord.PolyML.PTR)
      val isOwner_ = call (load_sym libglib "g_main_context_is_owner") (GLibMainContextRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val iteration_ = call (load_sym libglib "g_main_context_iteration") (GLibMainContextRecord.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.Bool.VAL)
      val pending_ = call (load_sym libglib "g_main_context_pending") (GLibMainContextRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val popThreadDefault_ = call (load_sym libglib "g_main_context_pop_thread_default") (GLibMainContextRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val pushThreadDefault_ = call (load_sym libglib "g_main_context_push_thread_default") (GLibMainContextRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val release_ = call (load_sym libglib "g_main_context_release") (GLibMainContextRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val removePoll_ = call (load_sym libglib "g_main_context_remove_poll") (GLibMainContextRecord.PolyML.PTR &&> GLibPollFDRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val wait_ =
        call (load_sym libglib "g_main_context_wait")
          (
            GLibMainContextRecord.PolyML.PTR
             &&> GLibCondRecord.PolyML.PTR
             &&> GLibMutexRecord.PolyML.PTR
             --> FFI.PolyML.Bool.VAL
          )
      val wakeup_ = call (load_sym libglib "g_main_context_wakeup") (GLibMainContextRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val default_ = call (load_sym libglib "g_main_context_default") (FFI.PolyML.VOID --> GLibMainContextRecord.PolyML.PTR)
      val getThreadDefault_ = call (load_sym libglib "g_main_context_get_thread_default") (FFI.PolyML.VOID --> GLibMainContextRecord.PolyML.PTR)
    end
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
    fun findSourceById self sourceId = (GLibMainContextRecord.C.withPtr &&&> FFI.Word32.withVal ---> GLibSourceRecord.C.fromPtr false) findSourceById_ (self & sourceId)
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
