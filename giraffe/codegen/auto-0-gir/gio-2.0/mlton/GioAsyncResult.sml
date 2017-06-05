structure GioAsyncResult :>
  GIO_ASYNC_RESULT
    where type 'a class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_async_result_get_type" : unit -> GObjectType.FFI.val_;
    val getSourceObject_ = _import "g_async_result_get_source_object" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
    type 'a class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getSourceObject self = (GioAsyncResultClass.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr true) getSourceObject_ self
  end
