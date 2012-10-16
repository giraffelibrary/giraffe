structure GioInitable :>
  GIO_INITABLE
    where type 'a class_t = 'a GioInitableClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_initable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val init_ =
        call (load_sym libgio "g_initable_init")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
    end
    type 'a class_t = 'a GioInitableClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun init self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        init_
        (
          self
           & cancellable
           & []
        )
  end
