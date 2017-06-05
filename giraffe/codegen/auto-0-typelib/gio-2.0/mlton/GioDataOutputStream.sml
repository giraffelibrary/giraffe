structure GioDataOutputStream :>
  GIO_DATA_OUTPUT_STREAM
    where type 'a class = 'a GioDataOutputStreamClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type data_stream_byte_order_t = GioDataStreamByteOrder.t =
  struct
    val getType_ = _import "g_data_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_data_output_stream_new" : GioOutputStreamClass.FFI.notnull GioOutputStreamClass.FFI.p -> GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p;
    val getByteOrder_ = _import "g_data_output_stream_get_byte_order" : GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p -> GioDataStreamByteOrder.FFI.val_;
    val putByte_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_output_stream_put_byte" :
              GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p
               * GUInt8.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val putInt16_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_output_stream_put_int16" :
              GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p
               * GInt16.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val putInt32_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_output_stream_put_int32" :
              GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p
               * GInt32.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val putInt64_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_output_stream_put_int64" :
              GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p
               * GInt64.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val putString_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_data_output_stream_put_string" :
              GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val putUint16_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_output_stream_put_uint16" :
              GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p
               * GUInt16.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val putUint32_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_output_stream_put_uint32" :
              GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p
               * GUInt32.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val putUint64_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_output_stream_put_uint64" :
              GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p
               * GUInt64.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setByteOrder_ = fn x1 & x2 => (_import "g_data_output_stream_set_byte_order" : GioDataOutputStreamClass.FFI.notnull GioDataOutputStreamClass.FFI.p * GioDataStreamByteOrder.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioDataOutputStreamClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type data_stream_byte_order_t = GioDataStreamByteOrder.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioOutputStreamClass.FFI.withPtr ---> GioDataOutputStreamClass.FFI.fromPtr true) new_ baseStream
    fun getByteOrder self = (GioDataOutputStreamClass.FFI.withPtr ---> GioDataStreamByteOrder.FFI.fromVal) getByteOrder_ self
    fun putByte self data cancellable =
      (
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GUInt8.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        GioDataOutputStreamClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GUInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        GioDataOutputStreamClass.FFI.withPtr
         &&&> GUInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
