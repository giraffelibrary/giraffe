structure GioPollableOutputStream :>
  GIO_POLLABLE_OUTPUT_STREAM
    where type 'a class = 'a GioPollableOutputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_pollable_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val canPoll_ = call (getSymbol "g_pollable_output_stream_can_poll") (GioPollableOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val createSource_ = call (getSymbol "g_pollable_output_stream_create_source") (GioPollableOutputStreamClass.PolyML.cPtr &&> GioCancellableClass.PolyML.cOptPtr --> GLibSourceRecord.PolyML.cPtr)
      val isWritable_ = call (getSymbol "g_pollable_output_stream_is_writable") (GioPollableOutputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val writeNonblocking_ =
        call (getSymbol "g_pollable_output_stream_write_nonblocking")
          (
            GioPollableOutputStreamClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
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
    fun createSource self cancellable = (GioPollableOutputStreamClass.FFI.withPtr &&&> GioCancellableClass.FFI.withOptPtr ---> GLibSourceRecord.FFI.fromPtr true) createSource_ (self & cancellable)
    fun isWritable self = (GioPollableOutputStreamClass.FFI.withPtr ---> GBool.FFI.fromVal) isWritable_ self
    fun writeNonblocking self (buffer, cancellable) =
      let
        val count = LargeInt.fromInt (GUInt8CArrayN.length buffer)
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
