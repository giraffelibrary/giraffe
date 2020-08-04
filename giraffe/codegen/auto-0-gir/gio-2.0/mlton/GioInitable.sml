structure GioInitable :>
  GIO_INITABLE
    where type 'a class = 'a GioInitableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_initable_get_type" : unit -> GObjectType.FFI.val_;
    val init_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_initable_init" :
              GioInitableClass.FFI.non_opt GioInitableClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioInitableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun init self cancellable =
      (
        GioInitableClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        init_
        (
          self
           & cancellable
           & []
        )
  end
