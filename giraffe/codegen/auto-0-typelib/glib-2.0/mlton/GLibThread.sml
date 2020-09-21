structure GLibThread :>
  G_LIB_THREAD
    where type t = GLibThreadRecord.t =
  struct
    val getType_ = _import "g_thread_get_type" : unit -> GObjectType.FFI.val_;
    val self_ = _import "g_thread_self" : unit -> GLibThreadRecord.FFI.non_opt GLibThreadRecord.FFI.p;
    val yield_ = _import "g_thread_yield" : unit -> unit;
    type t = GLibThreadRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun self () = (I ---> GLibThreadRecord.FFI.fromPtr true) self_ ()
    fun yield () = (I ---> I) yield_ ()
  end
