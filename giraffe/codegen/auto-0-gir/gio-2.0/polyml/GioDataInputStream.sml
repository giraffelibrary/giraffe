structure GioDataInputStream :>
  GIO_DATA_INPUT_STREAM
    where type 'a class = 'a GioDataInputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type data_stream_byte_order_t = GioDataStreamByteOrder.t
    where type data_stream_newline_type_t = GioDataStreamNewlineType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_data_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_data_input_stream_new") (GioInputStreamClass.PolyML.cPtr --> GioDataInputStreamClass.PolyML.cPtr)
      val getByteOrder_ = call (getSymbol "g_data_input_stream_get_byte_order") (GioDataInputStreamClass.PolyML.cPtr --> GioDataStreamByteOrder.PolyML.cVal)
      val getNewlineType_ = call (getSymbol "g_data_input_stream_get_newline_type") (GioDataInputStreamClass.PolyML.cPtr --> GioDataStreamNewlineType.PolyML.cVal)
      val readByte_ =
        call (getSymbol "g_data_input_stream_read_byte")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt8.PolyML.cVal
          )
      val readInt16_ =
        call (getSymbol "g_data_input_stream_read_int16")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt16.PolyML.cVal
          )
      val readInt32_ =
        call (getSymbol "g_data_input_stream_read_int32")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt32.PolyML.cVal
          )
      val readInt64_ =
        call (getSymbol "g_data_input_stream_read_int64")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt64.PolyML.cVal
          )
      val readLine_ =
        call (getSymbol "g_data_input_stream_read_line")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GSize.PolyML.cRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt8CArray.PolyML.cOutOptPtr
          )
      val readLineFinish_ =
        call (getSymbol "g_data_input_stream_read_line_finish")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt8CArray.PolyML.cOutOptPtr
          )
      val readLineFinishUtf8_ =
        call (getSymbol "g_data_input_stream_read_line_finish_utf8")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutOptPtr
          )
      val readLineUtf8_ =
        call (getSymbol "g_data_input_stream_read_line_utf8")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GSize.PolyML.cRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutOptPtr
          )
      val readUint16_ =
        call (getSymbol "g_data_input_stream_read_uint16")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt16.PolyML.cVal
          )
      val readUint32_ =
        call (getSymbol "g_data_input_stream_read_uint32")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt32.PolyML.cVal
          )
      val readUint64_ =
        call (getSymbol "g_data_input_stream_read_uint64")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GUInt64.PolyML.cVal
          )
      val readUntil_ =
        call (getSymbol "g_data_input_stream_read_until")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSize.PolyML.cRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUntilFinish_ =
        call (getSymbol "g_data_input_stream_read_until_finish")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUpto_ =
        call (getSymbol "g_data_input_stream_read_upto")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GSSize.PolyML.cVal
             &&> GSize.PolyML.cRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUptoFinish_ =
        call (getSymbol "g_data_input_stream_read_upto_finish")
          (
            GioDataInputStreamClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val setByteOrder_ = call (getSymbol "g_data_input_stream_set_byte_order") (GioDataInputStreamClass.PolyML.cPtr &&> GioDataStreamByteOrder.PolyML.cVal --> cVoid)
      val setNewlineType_ = call (getSymbol "g_data_input_stream_set_newline_type") (GioDataInputStreamClass.PolyML.cPtr &&> GioDataStreamNewlineType.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioDataInputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type data_stream_byte_order_t = GioDataStreamByteOrder.t
    type data_stream_newline_type_t = GioDataStreamNewlineType.t
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr false ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioInputStreamClass.FFI.withPtr false ---> GioDataInputStreamClass.FFI.fromPtr true) new_ baseStream
    fun getByteOrder self = (GioDataInputStreamClass.FFI.withPtr false ---> GioDataStreamByteOrder.FFI.fromVal) getByteOrder_ self
    fun getNewlineType self = (GioDataInputStreamClass.FFI.withPtr false ---> GioDataStreamNewlineType.FFI.fromVal) getNewlineType_ self
    fun readByte self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GUInt8.FFI.fromVal
      )
        readByte_
        (
          self
           & cancellable
           & []
        )
    fun readInt16 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt16.FFI.fromVal
      )
        readInt16_
        (
          self
           & cancellable
           & []
        )
    fun readInt32 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt32.FFI.fromVal
      )
        readInt32_
        (
          self
           & cancellable
           & []
        )
    fun readInt64 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GInt64.FFI.fromVal
      )
        readInt64_
        (
          self
           & cancellable
           & []
        )
    fun readLine self cancellable =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr false
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && GUInt8CArray.FFI.fromOptPtr ~1
          )
            readLine_
            (
              self
               & GSize.null
               & cancellable
               & []
            )
      in
        (retVal, length)
      end
    fun readLineFinish self result =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && GUInt8CArray.FFI.fromOptPtr ~1
          )
            readLineFinish_
            (
              self
               & result
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
    fun readLineFinishUtf8 self result =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromOptPtr ~1
          )
            readLineFinishUtf8_
            (
              self
               & result
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
    fun readLineUtf8 self cancellable =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr false
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromOptPtr ~1
          )
            readLineUtf8_
            (
              self
               & GSize.null
               & cancellable
               & []
            )
      in
        (retVal, length)
      end
    fun readUint16 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GUInt16.FFI.fromVal
      )
        readUint16_
        (
          self
           & cancellable
           & []
        )
    fun readUint32 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GUInt32.FFI.fromVal
      )
        readUint32_
        (
          self
           & cancellable
           & []
        )
    fun readUint64 self cancellable =
      (
        GioDataInputStreamClass.FFI.withPtr false
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> GUInt64.FFI.fromVal
      )
        readUint64_
        (
          self
           & cancellable
           & []
        )
    fun readUntil self (stopChars, cancellable) =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromPtr ~1
          )
            readUntil_
            (
              self
               & stopChars
               & GSize.null
               & cancellable
               & []
            )
      in
        (retVal, length)
      end
    fun readUntilFinish self result =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromPtr ~1
          )
            readUntilFinish_
            (
              self
               & result
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
    fun readUpto
      self
      (
        stopChars,
        stopCharsLen,
        cancellable
      ) =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GSSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GioCancellableClass.FFI.withOptPtr false
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromPtr ~1
          )
            readUpto_
            (
              self
               & stopChars
               & stopCharsLen
               & GSize.null
               & cancellable
               & []
            )
      in
        (retVal, length)
      end
    fun readUptoFinish self result =
      let
        val length & retVal =
          (
            GioDataInputStreamClass.FFI.withPtr false
             &&&> GioAsyncResultClass.FFI.withPtr false
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal && Utf8.FFI.fromPtr ~1
          )
            readUptoFinish_
            (
              self
               & result
               & GSize.null
               & []
            )
      in
        (retVal, length)
      end
    fun setByteOrder self order = (GioDataInputStreamClass.FFI.withPtr false &&&> GioDataStreamByteOrder.FFI.withVal ---> I) setByteOrder_ (self & order)
    fun setNewlineType self type' = (GioDataInputStreamClass.FFI.withPtr false &&&> GioDataStreamNewlineType.FFI.withVal ---> I) setNewlineType_ (self & type')
    local
      open Property
    in
      val byteOrderProp =
        {
          get = fn x => get "byte-order" GioDataStreamByteOrder.t x,
          set = fn x => set "byte-order" GioDataStreamByteOrder.t x,
          new = fn x => new "byte-order" GioDataStreamByteOrder.t x
        }
      val newlineTypeProp =
        {
          get = fn x => get "newline-type" GioDataStreamNewlineType.t x,
          set = fn x => set "newline-type" GioDataStreamNewlineType.t x,
          new = fn x => new "newline-type" GioDataStreamNewlineType.t x
        }
    end
  end
