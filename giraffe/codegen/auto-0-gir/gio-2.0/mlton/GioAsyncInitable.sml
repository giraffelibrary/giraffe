structure GioAsyncInitable :>
  GIO_ASYNC_INITABLE
    where type 'a class = 'a GioAsyncInitableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_async_initable_get_type" : unit -> GObjectType.FFI.val_;
    val initFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_async_initable_init_finish" :
              GioAsyncInitableClass.FFI.non_opt GioAsyncInitableClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioAsyncInitableClass.FFI.non_opt GioAsyncInitableClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioAsyncInitableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun initFinish self res =
      (
        GioAsyncInitableClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        initFinish_
        (
          self
           & res
           & []
        )
    fun newFinish self res =
      (
        GioAsyncInitableClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GObjectObjectClass.FFI.fromPtr true
      )
        newFinish_
        (
          self
           & res
           & []
        )
  end
