structure GioPollableOutputStream :>
  GIO_POLLABLE_OUTPUT_STREAM
    where type 'a class = 'a GioPollableOutputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_pollable_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val canPoll_ = _import "g_pollable_output_stream_can_poll" : GioPollableOutputStreamClass.FFI.non_opt GioPollableOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val createSource_ = fn x1 & x2 => (_import "g_pollable_output_stream_create_source" : GioPollableOutputStreamClass.FFI.non_opt GioPollableOutputStreamClass.FFI.p * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;) (x1, x2)
    val isWritable_ = _import "g_pollable_output_stream_is_writable" : GioPollableOutputStreamClass.FFI.non_opt GioPollableOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val writeNonblocking_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_pollable_output_stream_write_nonblocking" :
              GioPollableOutputStreamClass.FFI.non_opt GioPollableOutputStreamClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
    type 'a class = 'a GioPollableOutputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canPoll self = (GioPollableOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) canPoll_ self
    fun createSource self cancellable = (GioPollableOutputStreamClass.FFI.withPtr &&&> GioCancellableClass.FFI.withOptPtr ---> GLibSourceRecord.FFI.fromPtr true) createSource_ (self & cancellable)
    fun isWritable self = (GioPollableOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isWritable_ self
    fun writeNonblocking self (buffer, cancellable) =
      let
        val count = GUInt8CArrayN.length buffer
        val retVal =
          (
            GioPollableOutputStreamClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
          )
            writeNonblocking_
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
  end
