structure GioPollableOutputStream :>
  GIO_POLLABLE_OUTPUT_STREAM
    where type 'a class = 'a GioPollableOutputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    val getType_ = _import "g_pollable_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val canPoll_ = _import "g_pollable_output_stream_can_poll" : GioPollableOutputStreamClass.FFI.notnull GioPollableOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val isWritable_ = _import "g_pollable_output_stream_is_writable" : GioPollableOutputStreamClass.FFI.notnull GioPollableOutputStreamClass.FFI.p -> GBool.FFI.val_;
    val writeNonblocking_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_pollable_output_stream_write_nonblocking" :
              GioPollableOutputStreamClass.FFI.notnull GioPollableOutputStreamClass.FFI.p
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
    type 'a class = 'a GioPollableOutputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canPoll self = (GioPollableOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) canPoll_ self
    fun isWritable self = (GioPollableOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isWritable_ self
    fun writeNonblocking self (buffer, cancellable) =
      let
        val size = LargeInt.fromInt (GUInt8CVectorN.length buffer)
        val retVal =
          (
            GioPollableOutputStreamClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GSSize.FFI.fromVal
          )
            writeNonblocking_
            (
              self
               & buffer
               & size
               & cancellable
               & []
            )
      in
        retVal
      end
  end
