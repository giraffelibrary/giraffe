structure GioDataInputStream :>
  GIO_DATA_INPUT_STREAM
    where type 'a class = 'a GioDataInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type data_stream_byte_order_t = GioDataStreamByteOrder.t
    where type data_stream_newline_type_t = GioDataStreamNewlineType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_data_input_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_data_input_stream_new") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getByteOrder_ = call (load_sym libgio "g_data_input_stream_get_byte_order") (GObjectObjectClass.PolyML.cPtr --> GioDataStreamByteOrder.PolyML.cVal)
      val getNewlineType_ = call (load_sym libgio "g_data_input_stream_get_newline_type") (GObjectObjectClass.PolyML.cPtr --> GioDataStreamNewlineType.PolyML.cVal)
      val readByte_ =
        call (load_sym libgio "g_data_input_stream_read_byte")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.UInt8.PolyML.cVal
          )
      val readInt16_ =
        call (load_sym libgio "g_data_input_stream_read_int16")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int16.PolyML.cVal
          )
      val readInt32_ =
        call (load_sym libgio "g_data_input_stream_read_int32")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int32.PolyML.cVal
          )
      val readInt64_ =
        call (load_sym libgio "g_data_input_stream_read_int64")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int64.PolyML.cVal
          )
      val readLineFinishUtf8_ =
        call (load_sym libgio "g_data_input_stream_read_line_finish_utf8")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readLineUtf8_ =
        call (load_sym libgio "g_data_input_stream_read_line_utf8")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt64.PolyML.cRef
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUint16_ =
        call (load_sym libgio "g_data_input_stream_read_uint16")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.UInt16.PolyML.cVal
          )
      val readUint32_ =
        call (load_sym libgio "g_data_input_stream_read_uint32")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.UInt32.PolyML.cVal
          )
      val readUint64_ =
        call (load_sym libgio "g_data_input_stream_read_uint64")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.UInt64.PolyML.cVal
          )
      val readUntil_ =
        call (load_sym libgio "g_data_input_stream_read_until")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.UInt64.PolyML.cRef
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUntilFinish_ =
        call (load_sym libgio "g_data_input_stream_read_until_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUpto_ =
        call (load_sym libgio "g_data_input_stream_read_upto")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int64.PolyML.cVal
             &&> FFI.UInt64.PolyML.cRef
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUptoFinish_ =
        call (load_sym libgio "g_data_input_stream_read_upto_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt64.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val setByteOrder_ = call (load_sym libgio "g_data_input_stream_set_byte_order") (GObjectObjectClass.PolyML.cPtr &&> GioDataStreamByteOrder.PolyML.cVal --> FFI.PolyML.cVoid)
      val setNewlineType_ = call (load_sym libgio "g_data_input_stream_set_newline_type") (GObjectObjectClass.PolyML.cPtr &&> GioDataStreamNewlineType.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioDataInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type data_stream_byte_order_t = GioDataStreamByteOrder.t
    type data_stream_newline_type_t = GioDataStreamNewlineType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GObjectObjectClass.C.withPtr ---> GioDataInputStreamClass.C.fromPtr true) new_ baseStream
    fun getByteOrder self = (GObjectObjectClass.C.withPtr ---> GioDataStreamByteOrder.C.fromVal) getByteOrder_ self
    fun getNewlineType self = (GObjectObjectClass.C.withPtr ---> GioDataStreamNewlineType.C.fromVal) getNewlineType_ self
    fun readByte self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.UInt8.C.fromVal
      )
        readByte_
        (
          self
           & cancellable
           & []
        )
    fun readInt16 self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int16.C.fromVal
      )
        readInt16_
        (
          self
           & cancellable
           & []
        )
    fun readInt32 self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int32.C.fromVal
      )
        readInt32_
        (
          self
           & cancellable
           & []
        )
    fun readInt64 self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int64.C.fromVal
      )
        readInt64_
        (
          self
           & cancellable
           & []
        )
    fun readLineFinishUtf8 self result =
      let
        val length & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.UInt64.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.UInt64.C.fromVal && Utf8.C.fromPtr true
          )
            readLineFinishUtf8_
            (
              self
               & result
               & FFI.UInt64.null
               & []
            )
      in
        (retVal, length)
      end
    fun readLineUtf8 self cancellable =
      let
        val length & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt64.C.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> FFI.UInt64.C.fromVal && Utf8.C.fromPtr true
          )
            readLineUtf8_
            (
              self
               & FFI.UInt64.null
               & cancellable
               & []
            )
      in
        (retVal, length)
      end
    fun readUint16 self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.UInt16.C.fromVal
      )
        readUint16_
        (
          self
           & cancellable
           & []
        )
    fun readUint32 self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.UInt32.C.fromVal
      )
        readUint32_
        (
          self
           & cancellable
           & []
        )
    fun readUint64 self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.UInt64.C.fromVal
      )
        readUint64_
        (
          self
           & cancellable
           & []
        )
    fun readUntil self stopChars cancellable =
      let
        val length & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> FFI.UInt64.C.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> FFI.UInt64.C.fromVal && Utf8.C.fromPtr true
          )
            readUntil_
            (
              self
               & stopChars
               & FFI.UInt64.null
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
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.UInt64.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.UInt64.C.fromVal && Utf8.C.fromPtr true
          )
            readUntilFinish_
            (
              self
               & result
               & FFI.UInt64.null
               & []
            )
      in
        (retVal, length)
      end
    fun readUpto self stopChars stopCharsLen cancellable =
      let
        val length & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> FFI.Int64.C.withVal
             &&&> FFI.UInt64.C.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> FFI.UInt64.C.fromVal && Utf8.C.fromPtr true
          )
            readUpto_
            (
              self
               & stopChars
               & stopCharsLen
               & FFI.UInt64.null
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
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.UInt64.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.UInt64.C.fromVal && Utf8.C.fromPtr true
          )
            readUptoFinish_
            (
              self
               & result
               & FFI.UInt64.null
               & []
            )
      in
        (retVal, length)
      end
    fun setByteOrder self order = (GObjectObjectClass.C.withPtr &&&> GioDataStreamByteOrder.C.withVal ---> I) setByteOrder_ (self & order)
    fun setNewlineType self type' = (GObjectObjectClass.C.withPtr &&&> GioDataStreamNewlineType.C.withVal ---> I) setNewlineType_ (self & type')
    local
      open Property
    in
      val byteOrderProp =
        {
          get = fn x => get "byte-order" GioDataStreamByteOrder.t x,
          set = fn x => set "byte-order" GioDataStreamByteOrder.t x
        }
      val newlineTypeProp =
        {
          get = fn x => get "newline-type" GioDataStreamNewlineType.t x,
          set = fn x => set "newline-type" GioDataStreamNewlineType.t x
        }
    end
  end
