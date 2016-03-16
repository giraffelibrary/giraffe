structure GioCancellable :>
  GIO_CANCELLABLE
    where type 'a class_t = 'a GioCancellableClass.t =
  struct
    val getType_ = _import "g_cancellable_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_cancellable_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCurrent_ = _import "g_cancellable_get_current" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val cancel_ = _import "g_cancellable_cancel" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val disconnect_ = fn x1 & x2 => (_import "g_cancellable_disconnect" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.ULong.C.val_ -> unit;) (x1, x2)
    val getFd_ = _import "g_cancellable_get_fd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val isCancelled_ = _import "g_cancellable_is_cancelled" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val makePollfd_ = fn x1 & x2 => (_import "g_cancellable_make_pollfd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GLibPollFDRecord.C.notnull GLibPollFDRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val popCurrent_ = _import "g_cancellable_pop_current" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val pushCurrent_ = _import "g_cancellable_push_current" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val releaseFd_ = _import "g_cancellable_release_fd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val reset_ = _import "g_cancellable_reset" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setErrorIfCancelled_ = fn x1 & x2 => (_import "g_cancellable_set_error_if_cancelled" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Bool.C.val_;) (x1, x2)
    type 'a class_t = 'a GioCancellableClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioCancellableClass.C.fromPtr true) new_ ()
    fun getCurrent () = (I ---> GioCancellableClass.C.fromPtr false) getCurrent_ ()
    fun cancel self = (GObjectObjectClass.C.withPtr ---> I) cancel_ self
    fun disconnect self handlerId = (GObjectObjectClass.C.withPtr &&&> FFI.ULong.C.withVal ---> I) disconnect_ (self & handlerId)
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getFd_ self
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
