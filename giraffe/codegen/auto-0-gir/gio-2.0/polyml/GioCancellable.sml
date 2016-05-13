structure GioCancellable :>
  GIO_CANCELLABLE
    where type 'a class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_cancellable_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_cancellable_new") (PolyMLFFI.cVoid --> GioCancellableClass.PolyML.cPtr)
      val getCurrent_ = call (load_sym libgio "g_cancellable_get_current") (PolyMLFFI.cVoid --> GioCancellableClass.PolyML.cPtr)
      val cancel_ = call (load_sym libgio "g_cancellable_cancel") (GioCancellableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val disconnect_ = call (load_sym libgio "g_cancellable_disconnect") (GioCancellableClass.PolyML.cPtr &&> FFI.ULong.PolyML.cVal --> PolyMLFFI.cVoid)
      val getFd_ = call (load_sym libgio "g_cancellable_get_fd") (GioCancellableClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val isCancelled_ = call (load_sym libgio "g_cancellable_is_cancelled") (GioCancellableClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val makePollfd_ = call (load_sym libgio "g_cancellable_make_pollfd") (GioCancellableClass.PolyML.cPtr &&> GLibPollFDRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val popCurrent_ = call (load_sym libgio "g_cancellable_pop_current") (GioCancellableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val pushCurrent_ = call (load_sym libgio "g_cancellable_push_current") (GioCancellableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val releaseFd_ = call (load_sym libgio "g_cancellable_release_fd") (GioCancellableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val reset_ = call (load_sym libgio "g_cancellable_reset") (GioCancellableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setErrorIfCancelled_ = call (load_sym libgio "g_cancellable_set_error_if_cancelled") (GioCancellableClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioCancellableClass.C.fromPtr true) new_ ()
    fun getCurrent () = (I ---> GioCancellableClass.C.fromPtr false) getCurrent_ ()
    fun cancel self = (GioCancellableClass.C.withPtr ---> I) cancel_ self
    fun disconnect self handlerId = (GioCancellableClass.C.withPtr &&&> FFI.ULong.C.withVal ---> I) disconnect_ (self & handlerId)
    fun getFd self = (GioCancellableClass.C.withPtr ---> FFI.Int.C.fromVal) getFd_ self
    fun isCancelled self = (GioCancellableClass.C.withPtr ---> FFI.Bool.C.fromVal) isCancelled_ self
    fun makePollfd self pollfd = (GioCancellableClass.C.withPtr &&&> GLibPollFDRecord.C.withPtr ---> FFI.Bool.C.fromVal) makePollfd_ (self & pollfd)
    fun popCurrent self = (GioCancellableClass.C.withPtr ---> I) popCurrent_ self
    fun pushCurrent self = (GioCancellableClass.C.withPtr ---> I) pushCurrent_ self
    fun releaseFd self = (GioCancellableClass.C.withPtr ---> I) releaseFd_ self
    fun reset self = (GioCancellableClass.C.withPtr ---> I) reset_ self
    fun setErrorIfCancelled self = (GioCancellableClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Bool.C.fromVal) setErrorIfCancelled_ (self & [])
    local
      open ClosureMarshal Signal
    in
      fun cancelledSig f = signal "cancelled" (void ---> ret_void) f
    end
  end
