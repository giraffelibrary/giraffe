structure GioPollableInputStream :>
  GIO_POLLABLE_INPUT_STREAM
    where type 'a class = 'a GioPollableInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_pollable_input_stream_get_type" : unit -> GObjectType.FFI.val_;
    val canPoll_ = _import "g_pollable_input_stream_can_poll" : GioPollableInputStreamClass.FFI.notnull GioPollableInputStreamClass.FFI.p -> GBool.FFI.val_;
    val createSource_ = fn x1 & x2 => (_import "g_pollable_input_stream_create_source" : GioPollableInputStreamClass.FFI.notnull GioPollableInputStreamClass.FFI.p * unit GioCancellableClass.FFI.p -> GLibSourceRecord.FFI.notnull GLibSourceRecord.FFI.p;) (x1, x2)
    val isReadable_ = _import "g_pollable_input_stream_is_readable" : GioPollableInputStreamClass.FFI.notnull GioPollableInputStreamClass.FFI.p -> GBool.FFI.val_;
    val readNonblocking_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_pollable_input_stream_read_nonblocking" :
              GioPollableInputStreamClass.FFI.notnull GioPollableInputStreamClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
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
    type 'a class = 'a GioPollableInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canPoll self = (GioPollableInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) canPoll_ self
    fun createSource self cancellable = (GioPollableInputStreamClass.FFI.withPtr &&&> GioCancellableClass.FFI.withOptPtr ---> GLibSourceRecord.FFI.fromPtr true) createSource_ (self & cancellable)
    fun isReadable self = (GioPollableInputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isReadable_ self
    fun readNonblocking self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
        val retVal =
          (
            GioPollableInputStreamClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
          )
            readNonblocking_
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
