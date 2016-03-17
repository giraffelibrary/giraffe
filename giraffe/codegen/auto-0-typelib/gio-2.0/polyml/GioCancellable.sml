structure GioCancellable :>
  GIO_CANCELLABLE
    where type 'a class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_cancellable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_cancellable_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getCurrent_ = call (load_sym libgio "g_cancellable_get_current") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val cancel_ = call (load_sym libgio "g_cancellable_cancel") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val disconnect_ = call (load_sym libgio "g_cancellable_disconnect") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt64.PolyML.cVal --> FFI.PolyML.cVoid)
      val getFd_ = call (load_sym libgio "g_cancellable_get_fd") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val isCancelled_ = call (load_sym libgio "g_cancellable_is_cancelled") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val makePollfd_ = call (load_sym libgio "g_cancellable_make_pollfd") (GObjectObjectClass.PolyML.cPtr &&> GLibPollFDRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val popCurrent_ = call (load_sym libgio "g_cancellable_pop_current") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val pushCurrent_ = call (load_sym libgio "g_cancellable_push_current") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val releaseFd_ = call (load_sym libgio "g_cancellable_release_fd") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val reset_ = call (load_sym libgio "g_cancellable_reset") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setErrorIfCancelled_ = call (load_sym libgio "g_cancellable_set_error_if_cancelled") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioCancellableClass.C.fromPtr true) new_ ()
    fun getCurrent () = (I ---> GioCancellableClass.C.fromPtr false) getCurrent_ ()
    fun cancel self = (GObjectObjectClass.C.withPtr ---> I) cancel_ self
    fun disconnect self handlerId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) disconnect_ (self & handlerId)
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
    fun isCancelled self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isCancelled_ self
    fun makePollfd self pollfd = (GObjectObjectClass.C.withPtr &&&> GLibPollFDRecord.C.withPtr ---> FFI.Bool.C.fromVal) makePollfd_ (self & pollfd)
    fun popCurrent self = (GObjectObjectClass.C.withPtr ---> I) popCurrent_ self
    fun pushCurrent self = (GObjectObjectClass.C.withPtr ---> I) pushCurrent_ self
    fun releaseFd self = (GObjectObjectClass.C.withPtr ---> I) releaseFd_ self
    fun reset self = (GObjectObjectClass.C.withPtr ---> I) reset_ self
    fun setErrorIfCancelled self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) setErrorIfCancelled_ (self & [])
    local
      open ClosureMarshal Signal
    in
      fun cancelledSig f = signal "cancelled" (void ---> ret_void) f
    end
  end
