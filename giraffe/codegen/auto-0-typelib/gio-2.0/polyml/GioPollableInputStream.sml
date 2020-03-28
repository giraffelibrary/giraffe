structure GioPollableInputStream :>
  GIO_POLLABLE_INPUT_STREAM
    where type 'a class = 'a GioPollableInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_pollable_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val canPoll_ = call (getSymbol "g_pollable_input_stream_can_poll") (GioPollableInputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val createSource_ = call (getSymbol "g_pollable_input_stream_create_source") (GioPollableInputStreamClass.PolyML.cPtr &&> GioCancellableClass.PolyML.cOptPtr --> GLibSourceRecord.PolyML.cPtr)
      val isReadable_ = call (getSymbol "g_pollable_input_stream_is_readable") (GioPollableInputStreamClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val readNonblocking_ =
        call (getSymbol "g_pollable_input_stream_read_nonblocking")
          (
            GioPollableInputStreamClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
    end
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
             &&&> GUInt64.FFI.withVal
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GInt64.FFI.fromVal
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
