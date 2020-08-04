structure GioLoadableIcon :>
  GIO_LOADABLE_ICON
    where type 'a class = 'a GioLoadableIconClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_loadable_icon_get_type" : unit -> GObjectType.FFI.val_;
    val load_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_loadable_icon_load" :
              GioLoadableIconClass.FFI.non_opt GioLoadableIconClass.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
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
              GioLoadableIconClass.FFI.non_opt GioLoadableIconClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun load self (size, cancellable) =
      let
        val type' & retVal =
          (
            GioLoadableIconClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1 && GioInputStreamClass.FFI.fromPtr true
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
    fun loadFinish self res =
      let
        val type' & retVal =
          (
            GioLoadableIconClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1 && GioInputStreamClass.FFI.fromPtr true
          )
            loadFinish_
            (
              self
               & res
               & NONE
               & []
            )
      in
        (retVal, type')
      end
  end
