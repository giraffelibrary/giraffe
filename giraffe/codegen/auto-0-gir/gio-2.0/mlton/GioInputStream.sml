structure GioInputStream :>
  GIO_INPUT_STREAM
    where type 'a class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    val getType_ = _import "g_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val clearPending_ = _import "g_input_stream_clear_pending" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_close" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val closeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_close_finish" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasPending_ = _import "g_input_stream_has_pending" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p -> GBool.FFI.val_;
    val isClosed_ = _import "g_input_stream_is_closed" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p -> GBool.FFI.val_;
    val read_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_input_stream_read" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GSize.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val readAll_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_input_stream_read_all" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GSize.FFI.val_
               * GSize.FFI.ref_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val readAllFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_input_stream_read_all_finish" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readBytes_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_input_stream_read_bytes" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GSize.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibBytesRecord.FFI.notnull GLibBytesRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readBytesFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_read_bytes_finish" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GLibBytesRecord.FFI.notnull GLibBytesRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val readFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_read_finish" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setPending_ = fn x1 & x2 => (_import "g_input_stream_set_pending" : GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val skip_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_input_stream_skip" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GSize.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val skipFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_input_stream_skip_finish" :
              GioInputStreamClass.FFI.notnull GioInputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GSSize.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearPending self = (GioInputStreamClass.FFI.withPtr ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        close_
        (
          self
           & cancellable
           & []
        )
    fun closeFinish self result =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GioInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun read self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CVectorN.length buffer)
        val retVal =
          (
            GioInputStreamClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
          )
            read_
            (
              self
               & buffer
               & count
               & cancellable
               & []
            )
      in
        retVal
      end
    fun readAll self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CVectorN.length buffer)
        val bytesRead & () =
          (
            GioInputStreamClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && ignore
          )
            readAll_
            (
              self
               & buffer
               & count
               & GSize.null
               & cancellable
               & []
            )
      in
        bytesRead
      end
    fun readAllFinish self result =
      let
        val bytesRead & () =
          (
            GioInputStreamClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && ignore
          )
            readAllFinish_
            (
              self
               & result
               & GSize.null
               & []
            )
      in
        bytesRead
      end
    fun readBytes self (count, cancellable) =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        readBytes_
        (
          self
           & count
           & cancellable
           & []
        )
    fun readBytesFinish self result =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        readBytesFinish_
        (
          self
           & result
           & []
        )
    fun readFinish self result =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        readFinish_
        (
          self
           & result
           & []
        )
    fun setPending self = (GioInputStreamClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) setPending_ (self & [])
    fun skip self (count, cancellable) =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GSize.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        skip_
        (
          self
           & count
           & cancellable
           & []
        )
    fun skipFinish self result =
      (
        GioInputStreamClass.FFI.withPtr
         &&&> GioAsyncResultClass.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GSSize.FFI.fromVal
      )
        skipFinish_
        (
          self
           & result
           & []
        )
  end
