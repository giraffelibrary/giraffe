structure GioAsyncInitable :>
  GIO_ASYNC_INITABLE
    where type 'a class = 'a GioAsyncInitableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_async_initable_get_type" : unit -> GObjectType.C.val_;
    val initFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_async_initable_init_finish" :
              GioAsyncInitableClass.C.notnull GioAsyncInitableClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val newFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_async_initable_new_finish" :
              GioAsyncInitableClass.C.notnull GioAsyncInitableClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioAsyncInitableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun initFinish self res =
      (
        GioAsyncInitableClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        initFinish_
        (
          self
           & res
           & []
        )
    fun newFinish self res =
      (
        GioAsyncInitableClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GObjectObjectClass.C.fromPtr true
      )
        newFinish_
        (
          self
           & res
           & []
        )
  end
