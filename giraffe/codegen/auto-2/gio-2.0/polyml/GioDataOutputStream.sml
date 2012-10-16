structure GioDataOutputStream :>
  GIO_DATA_OUTPUT_STREAM
    where type 'a class_t = 'a GioDataOutputStreamClass.t
    where type 'a outputstreamclass_t = 'a GioOutputStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type datastreambyteorder_t = GioDataStreamByteOrder.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_data_output_stream_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_data_output_stream_new") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getByteOrder_ = call (load_sym libgio "g_data_output_stream_get_byte_order") (GObjectObjectClass.PolyML.PTR --> GioDataStreamByteOrder.PolyML.VAL)
      val putByte_ =
        call (load_sym libgio "g_data_output_stream_put_byte")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word8.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val putInt16_ =
        call (load_sym libgio "g_data_output_stream_put_int16")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int16.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val putInt32_ =
        call (load_sym libgio "g_data_output_stream_put_int32")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val putInt64_ =
        call (load_sym libgio "g_data_output_stream_put_int64")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int64.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val putString_ =
        call (load_sym libgio "g_data_output_stream_put_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val putUint16_ =
        call (load_sym libgio "g_data_output_stream_put_uint16")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word16.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val putUint32_ =
        call (load_sym libgio "g_data_output_stream_put_uint32")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val putUint64_ =
        call (load_sym libgio "g_data_output_stream_put_uint64")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word64.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val setByteOrder_ = call (load_sym libgio "g_data_output_stream_set_byte_order") (GObjectObjectClass.PolyML.PTR &&> GioDataStreamByteOrder.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioDataOutputStreamClass.t
    type 'a outputstreamclass_t = 'a GioOutputStreamClass.t
    type 'a cancellableclass_t = 'a GioCancellableClass.t
    type datastreambyteorder_t = GioDataStreamByteOrder.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GObjectObjectClass.C.withPtr ---> GioDataOutputStreamClass.C.fromPtr true) new_ baseStream
    fun getByteOrder self = (GObjectObjectClass.C.withPtr ---> GioDataStreamByteOrder.C.fromVal) getByteOrder_ self
    fun putByte self data cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word8.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        putByte_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putInt16 self data cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int16.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        putInt16_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putInt32 self data cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        putInt32_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putInt64 self data cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int64.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        putInt64_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putString self str cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        putString_
        (
          self
           & str
           & cancellable
           & []
        )
    fun putUint16 self data cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word16.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        putUint16_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putUint32 self data cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word32.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        putUint32_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putUint64 self data cancellable =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Word64.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        putUint64_
        (
          self
           & data
           & cancellable
           & []
        )
    fun setByteOrder self order = (GObjectObjectClass.C.withPtr &&&> GioDataStreamByteOrder.C.withVal ---> I) setByteOrder_ (self & order)
    local
      open Property
    in
      val byteOrderProp =
        {
          get = fn x => get "byte-order" GioDataStreamByteOrder.t x,
          set = fn x => set "byte-order" GioDataStreamByteOrder.t x
        }
    end
  end
