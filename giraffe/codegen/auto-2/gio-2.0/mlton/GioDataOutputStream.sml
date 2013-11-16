structure GioDataOutputStream :>
  GIO_DATA_OUTPUT_STREAM
    where type 'a class_t = 'a GioDataOutputStreamClass.t
    where type 'a outputstreamclass_t = 'a GioOutputStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type datastreambyteorder_t = GioDataStreamByteOrder.t =
  struct
    val getType_ = _import "g_data_output_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_data_output_stream_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getByteOrder_ = _import "g_data_output_stream_get_byte_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDataStreamByteOrder.C.val_;
    val putByte_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_output_stream_put_byte" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt8.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int16.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int64.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt16.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt64.C.val_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setByteOrder_ = fn x1 & x2 => (_import "g_data_output_stream_set_byte_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioDataStreamByteOrder.C.val_ -> unit;) (x1, x2)
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
         &&&> FFI.UInt8.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int16.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int64.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt16.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
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
