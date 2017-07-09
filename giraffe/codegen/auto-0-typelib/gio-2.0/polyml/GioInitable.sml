structure GioInitable :>
  GIO_INITABLE
    where type 'a class = 'a GioInitableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_initable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val init_ =
        call (getSymbol "g_initable_init")
          (
            GioInitableClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GioInitableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun init self cancellable =
      (
        GioInitableClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        init_
        (
          self
           & cancellable
           & []
        )
  end
