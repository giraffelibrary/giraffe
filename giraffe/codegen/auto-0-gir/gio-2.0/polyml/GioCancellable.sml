structure GioCancellable :>
  GIO_CANCELLABLE
    where type 'a class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_cancellable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_cancellable_new") (cVoid --> GioCancellableClass.PolyML.cPtr)
      val getCurrent_ = call (getSymbol "g_cancellable_get_current") (cVoid --> GioCancellableClass.PolyML.cOptPtr)
      val cancel_ = call (getSymbol "g_cancellable_cancel") (GioCancellableClass.PolyML.cPtr --> cVoid)
      val disconnect_ = call (getSymbol "g_cancellable_disconnect") (GioCancellableClass.PolyML.cPtr &&> GULong.PolyML.cVal --> cVoid)
      val getFd_ = call (getSymbol "g_cancellable_get_fd") (GioCancellableClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val isCancelled_ = call (getSymbol "g_cancellable_is_cancelled") (GioCancellableClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val popCurrent_ = call (getSymbol "g_cancellable_pop_current") (GioCancellableClass.PolyML.cPtr --> cVoid)
      val pushCurrent_ = call (getSymbol "g_cancellable_push_current") (GioCancellableClass.PolyML.cPtr --> cVoid)
      val releaseFd_ = call (getSymbol "g_cancellable_release_fd") (GioCancellableClass.PolyML.cPtr --> cVoid)
      val reset_ = call (getSymbol "g_cancellable_reset") (GioCancellableClass.PolyML.cPtr --> cVoid)
      val setErrorIfCancelled_ = call (getSymbol "g_cancellable_set_error_if_cancelled") (GioCancellableClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioCancellableClass.FFI.fromPtr true) new_ ()
    fun getCurrent () = (I ---> GioCancellableClass.FFI.fromOptPtr false) getCurrent_ ()
    fun cancel self = (GioCancellableClass.FFI.withPtr false ---> I) cancel_ self
    fun disconnect self handlerId = (GioCancellableClass.FFI.withPtr false &&&> GULong.FFI.withVal ---> I) disconnect_ (self & handlerId)
    fun getFd self = (GioCancellableClass.FFI.withPtr false ---> GInt.FFI.fromVal) getFd_ self
    fun isCancelled self = (GioCancellableClass.FFI.withPtr false ---> GBool.FFI.fromVal) isCancelled_ self
    fun popCurrent self = (GioCancellableClass.FFI.withPtr false ---> I) popCurrent_ self
    fun pushCurrent self = (GioCancellableClass.FFI.withPtr false ---> I) pushCurrent_ self
    fun releaseFd self = (GioCancellableClass.FFI.withPtr false ---> I) releaseFd_ self
    fun reset self = (GioCancellableClass.FFI.withPtr false ---> I) reset_ self
    fun setErrorIfCancelled self = (GioCancellableClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) setErrorIfCancelled_ (self & [])
    local
      open ClosureMarshal Signal
    in
      fun cancelledSig f = signal "cancelled" (void ---> ret_void) f
    end
  end
