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
      val disconnect_ = call (load_sym libgio "g_cancellable_disconnect") (GioCancellableClass.PolyML.cPtr &&> GULong.PolyML.cVal --> PolyMLFFI.cVoid)
      val getFd_ = call (load_sym libgio "g_cancellable_get_fd") (GioCancellableClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val isCancelled_ = call (load_sym libgio "g_cancellable_is_cancelled") (GioCancellableClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val makePollfd_ = call (load_sym libgio "g_cancellable_make_pollfd") (GioCancellableClass.PolyML.cPtr &&> GLibPollFDRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val popCurrent_ = call (load_sym libgio "g_cancellable_pop_current") (GioCancellableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val pushCurrent_ = call (load_sym libgio "g_cancellable_push_current") (GioCancellableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val releaseFd_ = call (load_sym libgio "g_cancellable_release_fd") (GioCancellableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val reset_ = call (load_sym libgio "g_cancellable_reset") (GioCancellableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setErrorIfCancelled_ = call (load_sym libgio "g_cancellable_set_error_if_cancelled") (GioCancellableClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioCancellableClass.FFI.fromPtr true) new_ ()
    fun getCurrent () = (I ---> GioCancellableClass.FFI.fromPtr false) getCurrent_ ()
    fun cancel self = (GioCancellableClass.FFI.withPtr ---> I) cancel_ self
    fun disconnect self handlerId = (GioCancellableClass.FFI.withPtr &&&> GULong.FFI.withVal ---> I) disconnect_ (self & handlerId)
    fun getFd self = (GioCancellableClass.FFI.withPtr ---> GInt.FFI.fromVal) getFd_ self
    fun isCancelled self = (GioCancellableClass.FFI.withPtr ---> GBool.FFI.fromVal) isCancelled_ self
    fun makePollfd self pollfd = (GioCancellableClass.FFI.withPtr &&&> GLibPollFDRecord.FFI.withPtr ---> GBool.FFI.fromVal) makePollfd_ (self & pollfd)
    fun popCurrent self = (GioCancellableClass.FFI.withPtr ---> I) popCurrent_ self
    fun pushCurrent self = (GioCancellableClass.FFI.withPtr ---> I) pushCurrent_ self
    fun releaseFd self = (GioCancellableClass.FFI.withPtr ---> I) releaseFd_ self
    fun reset self = (GioCancellableClass.FFI.withPtr ---> I) reset_ self
    fun setErrorIfCancelled self = (GioCancellableClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GBool.FFI.fromVal) setErrorIfCancelled_ (self & [])
    local
      open ClosureMarshal Signal
    in
      fun cancelledSig f = signal "cancelled" (void ---> ret_void) f
    end
  end
