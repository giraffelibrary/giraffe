structure GioDataOutputStream :>
  GIO_DATA_OUTPUT_STREAM
    where type 'a class = 'a GioDataOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type data_stream_byte_order_t = GioDataStreamByteOrder.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_data_output_stream_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_data_output_stream_new") (GioOutputStreamClass.PolyML.cPtr --> GioDataOutputStreamClass.PolyML.cPtr)
      val getByteOrder_ = call (load_sym libgio "g_data_output_stream_get_byte_order") (GioDataOutputStreamClass.PolyML.cPtr --> GioDataStreamByteOrder.PolyML.cVal)
      val putByte_ =
        call (load_sym libgio "g_data_output_stream_put_byte")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> FFI.UInt8.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val putInt16_ =
        call (load_sym libgio "g_data_output_stream_put_int16")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> FFI.Int16.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val putInt32_ =
        call (load_sym libgio "g_data_output_stream_put_int32")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val putInt64_ =
        call (load_sym libgio "g_data_output_stream_put_int64")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> FFI.Int64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val putString_ =
        call (load_sym libgio "g_data_output_stream_put_string")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val putUint16_ =
        call (load_sym libgio "g_data_output_stream_put_uint16")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> FFI.UInt16.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val putUint32_ =
        call (load_sym libgio "g_data_output_stream_put_uint32")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val putUint64_ =
        call (load_sym libgio "g_data_output_stream_put_uint64")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> FFI.UInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setByteOrder_ = call (load_sym libgio "g_data_output_stream_set_byte_order") (GioDataOutputStreamClass.PolyML.cPtr &&> GioDataStreamByteOrder.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioDataOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type data_stream_byte_order_t = GioDataStreamByteOrder.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GioOutputStreamClass.C.withPtr ---> GioDataOutputStreamClass.C.fromPtr true) new_ baseStream
    fun getByteOrder self = (GioDataOutputStreamClass.C.withPtr ---> GioDataStreamByteOrder.C.fromVal) getByteOrder_ self
    fun putByte self data cancellable =
      (
        GioDataOutputStreamClass.C.withPtr
         &&&> FFI.UInt8.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
        GioDataOutputStreamClass.C.withPtr
         &&&> FFI.Int16.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
        GioDataOutputStreamClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
        GioDataOutputStreamClass.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
        GioDataOutputStreamClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
        GioDataOutputStreamClass.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
        GioDataOutputStreamClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
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
        GioDataOutputStreamClass.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        putUint64_
        (
          self
           & data
           & cancellable
           & []
        )
    fun setByteOrder self order = (GioDataOutputStreamClass.C.withPtr &&&> GioDataStreamByteOrder.C.withVal ---> I) setByteOrder_ (self & order)
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
