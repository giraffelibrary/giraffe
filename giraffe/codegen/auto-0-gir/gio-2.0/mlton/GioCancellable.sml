structure GioCancellable :>
  GIO_CANCELLABLE
    where type 'a class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_cancellable_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_cancellable_new" : unit -> GioCancellableClass.C.notnull GioCancellableClass.C.p;
    val getCurrent_ = _import "g_cancellable_get_current" : unit -> GioCancellableClass.C.notnull GioCancellableClass.C.p;
    val cancel_ = _import "g_cancellable_cancel" : GioCancellableClass.C.notnull GioCancellableClass.C.p -> unit;
    val disconnect_ = fn x1 & x2 => (_import "g_cancellable_disconnect" : GioCancellableClass.C.notnull GioCancellableClass.C.p * FFI.ULong.C.val_ -> unit;) (x1, x2)
    val getFd_ = _import "g_cancellable_get_fd" : GioCancellableClass.C.notnull GioCancellableClass.C.p -> FFI.Int.C.val_;
    val isCancelled_ = _import "g_cancellable_is_cancelled" : GioCancellableClass.C.notnull GioCancellableClass.C.p -> FFI.Bool.C.val_;
    val makePollfd_ = fn x1 & x2 => (_import "g_cancellable_make_pollfd" : GioCancellableClass.C.notnull GioCancellableClass.C.p * GLibPollFDRecord.C.notnull GLibPollFDRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val popCurrent_ = _import "g_cancellable_pop_current" : GioCancellableClass.C.notnull GioCancellableClass.C.p -> unit;
    val pushCurrent_ = _import "g_cancellable_push_current" : GioCancellableClass.C.notnull GioCancellableClass.C.p -> unit;
    val releaseFd_ = _import "g_cancellable_release_fd" : GioCancellableClass.C.notnull GioCancellableClass.C.p -> unit;
    val reset_ = _import "g_cancellable_reset" : GioCancellableClass.C.notnull GioCancellableClass.C.p -> unit;
    val setErrorIfCancelled_ = fn x1 & x2 => (_import "g_cancellable_set_error_if_cancelled" : GioCancellableClass.C.notnull GioCancellableClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
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
