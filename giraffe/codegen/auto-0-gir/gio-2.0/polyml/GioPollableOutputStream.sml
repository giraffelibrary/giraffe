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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_pollable_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val canPoll_ = call (getSymbol "g_pollable_output_stream_can_poll") (GioPollableOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isWritable_ = call (getSymbol "g_pollable_output_stream_is_writable") (GioPollableOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val writeNonblocking_ =
        call (getSymbol "g_pollable_output_stream_write_nonblocking")
          (
            GioPollableOutputStreamClass.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GSSize.PolyML.cVal
          )
    end
    type 'a class = 'a GioPollableOutputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun canPoll self = (GioPollableOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) canPoll_ self
    fun isWritable self = (GioPollableOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isWritable_ self
    fun writeNonblocking self buffer cancellable =
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
