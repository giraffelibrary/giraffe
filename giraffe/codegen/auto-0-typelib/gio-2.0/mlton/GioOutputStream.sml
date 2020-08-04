structure GioOutputStream :>
  GIO_OUTPUT_STREAM
    where type 'a class = 'a GioOutputStreamClass.class
    where type output_stream_splice_flags_t = GioOutputStreamSpliceFlags.t
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    val getType_ = _import "g_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val clearPending_ = _import "g_output_stream_clear_pending" : GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p -> unit;
    val close_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_close" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
            _import "g_output_stream_close_finish" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val flush_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_flush" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val flushFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_flush_finish" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasPending_ = _import "g_output_stream_has_pending" : GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val isClosed_ = _import "g_output_stream_is_closed" : GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val isClosing_ = _import "g_output_stream_is_closing" : GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val setPending_ = fn x1 & x2 => (_import "g_output_stream_set_pending" : GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val splice_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_output_stream_splice" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p
               * GioOutputStreamSpliceFlags.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val spliceFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_splice_finish" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val write_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_output_stream_write" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val writeAll_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_output_stream_write_all" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * GUInt64.FFI.ref_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
    val writeAllFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_output_stream_write_all_finish" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * GUInt64.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val writeBytes_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_output_stream_write_bytes" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val writeBytesFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_write_bytes_finish" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val writeFinish_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_output_stream_write_finish" :
              GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p
               * GioAsyncResultClass.FFI.non_opt GioAsyncResultClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GInt64.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioOutputStreamClass.class
    type output_stream_splice_flags_t = GioOutputStreamSpliceFlags.t
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearPending self = (GioOutputStreamClass.FFI.withPtr false ---> I) clearPending_ self
    fun close self cancellable =
      (
        GioOutputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioOutputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        closeFinish_
        (
          self
           & result
           & []
        )
    fun flush self cancellable =
      (
        GioOutputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        flush_
        (
          self
           & cancellable
           & []
        )
    fun flushFinish self result =
      (
        GioOutputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        flushFinish_
        (
          self
           & result
           & []
        )
    fun hasPending self = (GioOutputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GioOutputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosed_ self
    fun isClosing self = (GioOutputStreamClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosing_ self
    fun setPending self = (GioOutputStreamClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) setPending_ (self & [])
    fun splice
      self
      (
        source,
        flags,
        cancellable
      ) =
      (
        GioOutputStreamClass.FFI.withPtr false
         &&&> GioInputStreamClass.FFI.withPtr false
         &&&> GioOutputStreamSpliceFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        splice_
        (
          self
           & source
           & flags
           & cancellable
           & []
        )
    fun spliceFinish self result =
      (
        GioOutputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        spliceFinish_
        (
          self
           & result
           & []
        )
    fun write self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioOutputStreamClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
          )
            write_
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
    fun writeAll self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val bytesWritten & () =
          (
            GioOutputStreamClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GUInt64.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && ignore
          )
            writeAll_
            (
              self
               & buffer
               & count
               & GUInt64.null
               & cancellable
               & []
            )
      in
        bytesWritten
      end
    fun writeAllFinish self result =
      let
        val bytesWritten & () =
          (
            GioOutputStreamClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal && ignore
          )
            writeAllFinish_
            (
              self
               & result
               & GUInt64.null
               & []
            )
      in
        bytesWritten
      end
    fun writeBytes self (bytes, cancellable) =
      (
        GioOutputStreamClass.FFI.withPtr false
         &&&> GLibBytesRecord.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        writeBytes_
        (
          self
           & bytes
           & cancellable
           & []
        )
    fun writeBytesFinish self result =
      (
        GioOutputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        writeBytesFinish_
        (
          self
           & result
           & []
        )
    fun writeFinish self result =
      (
        GioOutputStreamClass.FFI.withPtr false
         &&&> GioAsyncResultClass.FFI.withPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        writeFinish_
        (
          self
           & result
           & []
        )
  end
