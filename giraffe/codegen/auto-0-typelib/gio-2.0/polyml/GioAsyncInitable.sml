structure GioAsyncInitable :>
  GIO_ASYNC_INITABLE
    where type 'a class_t = 'a GioAsyncInitableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_async_initable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val initFinish_ =
        call (load_sym libgio "g_async_initable_init_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val newFinish_ =
        call (load_sym libgio "g_async_initable_new_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type 'a class_t = 'a GioAsyncInitableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun initFinish self res =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GObjectObjectClass.C.fromPtr true
      )
        newFinish_
        (
          self
           & res
           & []
        )
  end
