structure GioInitable :>
  GIO_INITABLE
    where type 'a class_t = 'a GioInitableClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_initable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val init_ =
        call (load_sym libgio "g_initable_init")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class_t = 'a GioInitableClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun init self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        init_
        (
          self
           & cancellable
           & []
        )
  end
