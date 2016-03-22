structure GioAsyncInitable :>
  GIO_ASYNC_INITABLE
    where type 'a class = 'a GioAsyncInitableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_async_initable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val initFinish_ =
        call (load_sym libgio "g_async_initable_init_finish")
          (
            GioAsyncInitableClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val newFinish_ =
        call (load_sym libgio "g_async_initable_new_finish")
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
