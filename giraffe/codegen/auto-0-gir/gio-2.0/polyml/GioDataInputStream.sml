structure GioDataInputStream :>
  GIO_DATA_INPUT_STREAM
    where type 'a class_t = 'a GioDataInputStreamClass.t
    where type 'a input_stream_class_t = 'a GioInputStreamClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t
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
             &&> FFI.Size.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readLineUtf8_ =
        call (load_sym libgio "g_data_input_stream_read_line_utf8")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Size.PolyML.cRef
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
             &&> FFI.Size.PolyML.cRef
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUntilFinish_ =
        call (load_sym libgio "g_data_input_stream_read_until_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Size.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUpto_ =
        call (load_sym libgio "g_data_input_stream_read_upto")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.SSize.PolyML.cVal
             &&> FFI.Size.PolyML.cRef
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val readUptoFinish_ =
        call (load_sym libgio "g_data_input_stream_read_upto_finish")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Size.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8.PolyML.cOutPtr
          )
      val setByteOrder_ = call (load_sym libgio "g_data_input_stream_set_byte_order") (GObjectObjectClass.PolyML.cPtr &&> GioDataStreamByteOrder.PolyML.cVal --> FFI.PolyML.cVoid)
      val setNewlineType_ = call (load_sym libgio "g_data_input_stream_set_newline_type") (GObjectObjectClass.PolyML.cPtr &&> GioDataStreamNewlineType.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioDataInputStreamClass.t
    type 'a input_stream_class_t = 'a GioInputStreamClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type data_stream_byte_order_t = GioDataStreamByteOrder.t
    type data_stream_newline_type_t = GioDataStreamNewlineType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GObjectObjectClass.C.withPtr ---> GioDataInputStreamClass.C.fromPtr true) new_ baseStream
    fun getByteOrder self = (GObjectObjectClass.C.withPtr ---> GioDataStreamByteOrder.C.fromVal) getByteOrder_ self
    fun getNewlineType self = (GObjectObjectClass.C.withPtr ---> GioDataStreamNewlineType.C.fromVal) getNewlineType_ self
    fun readByte self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
             &&&> FFI.Size.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Size.C.fromVal && Utf8.C.fromPtr true
          )
            readLineFinishUtf8_
            (
              self
               & result
               & FFI.Size.null
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
             &&&> FFI.Size.C.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Size.C.fromVal && Utf8.C.fromPtr true
          )
            readLineUtf8_
            (
              self
               & FFI.Size.null
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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
             &&&> FFI.Size.C.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Size.C.fromVal && Utf8.C.fromPtr true
          )
            readUntil_
            (
              self
               & stopChars
               & FFI.Size.null
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
             &&&> FFI.Size.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Size.C.fromVal && Utf8.C.fromPtr true
          )
            readUntilFinish_
            (
              self
               & result
               & FFI.Size.null
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
             &&&> FFI.SSize.C.withVal
             &&&> FFI.Size.C.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Size.C.fromVal && Utf8.C.fromPtr true
          )
            readUpto_
            (
              self
               & stopChars
               & stopCharsLen
               & FFI.Size.null
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
             &&&> FFI.Size.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Size.C.fromVal && Utf8.C.fromPtr true
          )
            readUptoFinish_
            (
              self
               & result
               & FFI.Size.null
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
