structure GioAsyncInitable :>
  GIO_ASYNC_INITABLE
    where type 'a class = 'a GioAsyncInitableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_async_initable_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val initFinish_ =
        call (getSymbol "g_async_initable_init_finish")
          (
            GioAsyncInitableClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val newFinish_ =
        call (getSymbol "g_async_initable_new_finish")
          (
            GioAsyncInitableClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioAsyncInitableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun initFinish self res =
      (
        GioAsyncInitableClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        initFinish_
        (
          self
           & res
           & []
        )
    fun newFinish self res =
      (
        GioAsyncInitableClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
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
