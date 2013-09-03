structure GioCancellable :>
  GIO_CANCELLABLE
    where type 'a class_t = 'a GioCancellableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_cancellable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_cancellable_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getCurrent_ = call (load_sym libgio "g_cancellable_get_current") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val cancel_ = call (load_sym libgio "g_cancellable_cancel") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val disconnect_ = call (load_sym libgio "g_cancellable_disconnect") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.UInt64.VAL --> FFI.PolyML.VOID)
      val getFd_ = call (load_sym libgio "g_cancellable_get_fd") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val isCancelled_ = call (load_sym libgio "g_cancellable_is_cancelled") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val makePollfd_ = call (load_sym libgio "g_cancellable_make_pollfd") (GObjectObjectClass.PolyML.PTR &&> GLibPollFDRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val popCurrent_ = call (load_sym libgio "g_cancellable_pop_current") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val pushCurrent_ = call (load_sym libgio "g_cancellable_push_current") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val releaseFd_ = call (load_sym libgio "g_cancellable_release_fd") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val reset_ = call (load_sym libgio "g_cancellable_reset") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setErrorIfCancelled_ = call (load_sym libgio "g_cancellable_set_error_if_cancelled") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a GioCancellableClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioCancellableClass.C.fromPtr true) new_ ()
    fun getCurrent () = (I ---> GioCancellableClass.C.fromPtr false) getCurrent_ ()
    fun cancel self = (GObjectObjectClass.C.withPtr ---> I) cancel_ self
    fun disconnect self handlerId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt64.withVal ---> I) disconnect_ (self & handlerId)
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getFd_ self
    fun isCancelled self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isCancelled_ self
    fun makePollfd self pollfd = (GObjectObjectClass.C.withPtr &&&> GLibPollFDRecord.C.withPtr ---> FFI.Bool.fromVal) makePollfd_ (self & pollfd)
    fun popCurrent self = (GObjectObjectClass.C.withPtr ---> I) popCurrent_ self
    fun pushCurrent self = (GObjectObjectClass.C.withPtr ---> I) pushCurrent_ self
    fun releaseFd self = (GObjectObjectClass.C.withPtr ---> I) releaseFd_ self
    fun reset self = (GObjectObjectClass.C.withPtr ---> I) reset_ self
    fun setErrorIfCancelled self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Bool.fromVal) setErrorIfCancelled_ (self & [])
    local
      open ClosureMarshal Signal
    in
      fun cancelledSig f = signal "cancelled" (void ---> ret_void) f
    end
  end
