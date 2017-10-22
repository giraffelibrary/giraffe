structure GioDataOutputStream :>
  GIO_DATA_OUTPUT_STREAM
    where type 'a class = 'a GioDataOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type data_stream_byte_order_t = GioDataStreamByteOrder.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_data_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_data_output_stream_new") (GioOutputStreamClass.PolyML.cPtr --> GioDataOutputStreamClass.PolyML.cPtr)
      val getByteOrder_ = call (getSymbol "g_data_output_stream_get_byte_order") (GioDataOutputStreamClass.PolyML.cPtr --> GioDataStreamByteOrder.PolyML.cVal)
      val putByte_ =
        call (getSymbol "g_data_output_stream_put_byte")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> GUInt8.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val putInt16_ =
        call (getSymbol "g_data_output_stream_put_int16")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> GInt16.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val putInt32_ =
        call (getSymbol "g_data_output_stream_put_int32")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val putInt64_ =
        call (getSymbol "g_data_output_stream_put_int64")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val putString_ =
        call (getSymbol "g_data_output_stream_put_string")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val putUint16_ =
        call (getSymbol "g_data_output_stream_put_uint16")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> GUInt16.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val putUint32_ =
        call (getSymbol "g_data_output_stream_put_uint32")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val putUint64_ =
        call (getSymbol "g_data_output_stream_put_uint64")
          (
            GioDataOutputStreamClass.PolyML.cPtr
             &&> GUInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setByteOrder_ = call (getSymbol "g_data_output_stream_set_byte_order") (GioDataOutputStreamClass.PolyML.cPtr &&> GioDataStreamByteOrder.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioDataOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type data_stream_byte_order_t = GioDataStreamByteOrder.t
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioOutputStreamClass.FFI.withPtr ---> GioDataOutputStreamClass.FFI.fromPtr true) new_ baseStream
    fun getByteOrder self = (GioDataOutputStreamClass.FFI.withPtr ---> GioDataStreamByteOrder.FFI.fromVal) getByteOrder_ self
    fun putByte self (data, cancellable) =
      (
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GUInt8.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        putByte_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putInt16 self (data, cancellable) =
      (
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        putInt16_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putInt32 self (data, cancellable) =
      (
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        putInt32_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putInt64 self (data, cancellable) =
      (
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        putInt64_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putString self (str, cancellable) =
      (
        GioDataOutputStreamClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        putString_
        (
          self
           & str
           & cancellable
           & []
        )
    fun putUint16 self (data, cancellable) =
      (
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GUInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        putUint16_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putUint32 self (data, cancellable) =
      (
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        putUint32_
        (
          self
           & data
           & cancellable
           & []
        )
    fun putUint64 self (data, cancellable) =
      (
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        putUint64_
        (
          self
           & data
           & cancellable
           & []
        )
    fun setByteOrder self order = (GioDataOutputStreamClass.FFI.withPtr &&&> GioDataStreamByteOrder.FFI.withVal ---> I) setByteOrder_ (self & order)
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
