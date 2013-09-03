structure GioDataInputStream :>
  GIO_DATA_INPUT_STREAM
    where type 'a class_t = 'a GioDataInputStreamClass.t
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type datastreambyteorder_t = GioDataStreamByteOrder.t
    where type datastreamnewlinetype_t = GioDataStreamNewlineType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_data_input_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_data_input_stream_new") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getByteOrder_ = call (load_sym libgio "g_data_input_stream_get_byte_order") (GObjectObjectClass.PolyML.PTR --> GioDataStreamByteOrder.PolyML.VAL)
      val getNewlineType_ = call (load_sym libgio "g_data_input_stream_get_newline_type") (GObjectObjectClass.PolyML.PTR --> GioDataStreamNewlineType.PolyML.VAL)
      val readByte_ =
        call (load_sym libgio "g_data_input_stream_read_byte")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.UInt8.VAL
          )
      val readInt16_ =
        call (load_sym libgio "g_data_input_stream_read_int16")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Int16.VAL
          )
      val readInt32_ =
        call (load_sym libgio "g_data_input_stream_read_int32")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Int32.VAL
          )
      val readInt64_ =
        call (load_sym libgio "g_data_input_stream_read_int64")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Int64.VAL
          )
      val readLineFinishUtf8_ =
        call (load_sym libgio "g_data_input_stream_read_line_finish_utf8")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt64.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val readLineUtf8_ =
        call (load_sym libgio "g_data_input_stream_read_line_utf8")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt64.REF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val readUint16_ =
        call (load_sym libgio "g_data_input_stream_read_uint16")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.UInt16.VAL
          )
      val readUint32_ =
        call (load_sym libgio "g_data_input_stream_read_uint32")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.UInt32.VAL
          )
      val readUint64_ =
        call (load_sym libgio "g_data_input_stream_read_uint64")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.UInt64.VAL
          )
      val readUntil_ =
        call (load_sym libgio "g_data_input_stream_read_until")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.UInt64.REF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val readUntilFinish_ =
        call (load_sym libgio "g_data_input_stream_read_until_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt64.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val readUpto_ =
        call (load_sym libgio "g_data_input_stream_read_upto")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.Int64.VAL
             &&> FFI.PolyML.UInt64.REF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val readUptoFinish_ =
        call (load_sym libgio "g_data_input_stream_read_upto_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt64.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.String.RETPTR
          )
      val setByteOrder_ = call (load_sym libgio "g_data_input_stream_set_byte_order") (GObjectObjectClass.PolyML.PTR &&> GioDataStreamByteOrder.PolyML.VAL --> FFI.PolyML.VOID)
      val setNewlineType_ = call (load_sym libgio "g_data_input_stream_set_newline_type") (GObjectObjectClass.PolyML.PTR &&> GioDataStreamNewlineType.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioDataInputStreamClass.t
    type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    type datastreambyteorder_t = GioDataStreamByteOrder.t
    type datastreamnewlinetype_t = GioDataStreamNewlineType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GObjectObjectClass.C.withPtr ---> GioDataInputStreamClass.C.fromPtr true) new_ baseStream
    fun getByteOrder self = (GObjectObjectClass.C.withPtr ---> GioDataStreamByteOrder.C.fromVal) getByteOrder_ self
    fun getNewlineType self = (GObjectObjectClass.C.withPtr ---> GioDataStreamNewlineType.C.fromVal) getNewlineType_ self
    fun readByte self cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.UInt8.fromVal
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
         ---> FFI.Int16.fromVal
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
         ---> FFI.Int32.fromVal
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
         ---> FFI.Int64.fromVal
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
             &&&> FFI.UInt64.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.UInt64.fromVal && FFI.String.fromPtr true
          )
            readLineFinishUtf8_
            (
              self
               & result
               & 0
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
             &&&> FFI.UInt64.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.UInt64.fromVal && FFI.String.fromPtr true
          )
            readLineUtf8_
            (
              self
               & 0
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
         ---> FFI.UInt16.fromVal
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
         ---> FFI.UInt32.fromVal
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
         ---> FFI.UInt64.fromVal
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
             &&&> FFI.String.withConstPtr
             &&&> FFI.UInt64.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.UInt64.fromVal && FFI.String.fromPtr true
          )
            readUntil_
            (
              self
               & stopChars
               & 0
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
             &&&> FFI.UInt64.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.UInt64.fromVal && FFI.String.fromPtr true
          )
            readUntilFinish_
            (
              self
               & result
               & 0
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
             &&&> FFI.String.withConstPtr
             &&&> FFI.Int64.withVal
             &&&> FFI.UInt64.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.UInt64.fromVal && FFI.String.fromPtr true
          )
            readUpto_
            (
              self
               & stopChars
               & stopCharsLen
               & 0
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
             &&&> FFI.UInt64.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.UInt64.fromVal && FFI.String.fromPtr true
          )
            readUptoFinish_
            (
              self
               & result
               & 0
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
