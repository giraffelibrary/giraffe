structure GioAsyncResult :>
  GIO_ASYNC_RESULT
    where type 'a class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_async_result_get_type" : unit -> GObjectType.FFI.val_;
    val getSourceObject_ = _import "g_async_result_get_source_object" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p -> GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p;
    val legacyPropagateError_ = fn x1 & x2 => (_import "g_async_result_legacy_propagate_error" : GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    type 'a class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getSourceObject self = (GioAsyncResultClass.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr true) getSourceObject_ self
    fun legacyPropagateError self = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) legacyPropagateError_ (self & [])
  end
