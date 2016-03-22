structure GioLoadableIcon :>
  GIO_LOADABLE_ICON
    where type 'a class = 'a GioLoadableIconClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_loadable_icon_get_type" : unit -> GObjectType.C.val_;
    val load_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_loadable_icon_load" :
              GioLoadableIconClass.C.notnull GioLoadableIconClass.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.r1
               * (unit, Utf8.C.notnull) Utf8.MLton.r2
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> GioInputStreamClass.C.notnull GioInputStreamClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val loadFinish_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_loadable_icon_load_finish" :
              GioLoadableIconClass.C.notnull GioLoadableIconClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GioInputStreamClass.C.notnull GioInputStreamClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a GioLoadableIconClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun load self size cancellable =
      let
        val type' & retVal =
          (
            GioLoadableIconClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> Utf8.C.withRefOptPtr
             &&&> GioCancellableClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.C.fromPtr true && GioInputStreamClass.C.fromPtr true
          )
            load_
            (
              self
               & size
               & NONE
               & cancellable
               & []
            )
      in
        (retVal, type')
      end
    fun loadFinish self res type' =
      (
        GioLoadableIconClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioInputStreamClass.C.fromPtr true
      )
        loadFinish_
        (
          self
           & res
           & type'
           & []
        )
  end
