structure GioInitable :>
  GIO_INITABLE
    where type 'a class_t = 'a GioInitableClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t =
  struct
    val getType_ = _import "g_initable_get_type" : unit -> GObjectType.C.val_;
    val init_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_initable_init" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioInitableClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun init self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        init_
        (
          self
           & cancellable
           & []
        )
  end
