structure GioAsyncResult :>
  GIO_ASYNC_RESULT
    where type 'a class_t = 'a GioAsyncResultClass.t =
  struct
    val getType_ = _import "g_async_result_get_type" : unit -> GObjectType.C.val_;
    val getSourceObject_ = _import "g_async_result_get_source_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getSourceObject self = (GObjectObjectClass.C.withPtr ---> GObjectObjectClass.C.fromPtr true) getSourceObject_ self
  end
