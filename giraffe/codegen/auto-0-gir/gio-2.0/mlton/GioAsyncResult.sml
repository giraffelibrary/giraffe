structure GioAsyncResult :>
  GIO_ASYNC_RESULT
    where type 'a class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_async_result_get_type" : unit -> GObjectType.C.val_;
    val getSourceObject_ = _import "g_async_result_get_source_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getSourceObject self = (GObjectObjectClass.C.withPtr ---> GObjectObjectClass.C.fromPtr true) getSourceObject_ self
  end
