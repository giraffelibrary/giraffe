structure GioDataOutputStream :>
  GIO_DATA_OUTPUT_STREAM
    where type 'a class = 'a GioDataOutputStreamClass.class
    where type 'a seekable_class = 'a GioSeekableClass.class
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type data_stream_byte_order_t = GioDataStreamByteOrder.t =
  struct
    val getType_ = _import "g_data_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_data_output_stream_new" : GioOutputStreamClass.FFI.non_opt GioOutputStreamClass.FFI.p -> GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p;
    val getByteOrder_ = _import "g_data_output_stream_get_byte_order" : GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p -> GioDataStreamByteOrder.FFI.val_;
    val putByte_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_output_stream_put_byte" :
              GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p
               * GUInt8.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p
               * GInt16.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p
               * GInt32.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p
               * GInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p
               * GUInt16.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p
               * GUInt32.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
              GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p
               * GUInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setByteOrder_ = fn x1 & x2 => (_import "g_data_output_stream_set_byte_order" : GioDataOutputStreamClass.FFI.non_opt GioDataOutputStreamClass.FFI.p * GioDataStreamByteOrder.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioDataOutputStreamClass.class
    type 'a seekable_class = 'a GioSeekableClass.class
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type data_stream_byte_order_t = GioDataStreamByteOrder.t
    type t = base class
    fun asSeekable self = (GObjectObjectClass.FFI.withPtr false ---> GioSeekableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseStream = (GioOutputStreamClass.FFI.withPtr false ---> GioDataOutputStreamClass.FFI.fromPtr true) new_ baseStream
    fun getByteOrder self = (GioDataOutputStreamClass.FFI.withPtr false ---> GioDataStreamByteOrder.FFI.fromVal) getByteOrder_ self
    fun putByte self (data, cancellable) =
      (
        GioDataOutputStreamClass.FFI.withPtr false
         &&&> GUInt8.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioDataOutputStreamClass.FFI.withPtr false
         &&&> GInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioDataOutputStreamClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioDataOutputStreamClass.FFI.withPtr false
         &&&> GInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioDataOutputStreamClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioDataOutputStreamClass.FFI.withPtr false
         &&&> GUInt16.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioDataOutputStreamClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
        GioDataOutputStreamClass.FFI.withPtr false
         &&&> GUInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
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
    fun setByteOrder self order = (GioDataOutputStreamClass.FFI.withPtr false &&&> GioDataStreamByteOrder.FFI.withVal ---> I) setByteOrder_ (self & order)
    local
      open ValueAccessor
    in
      val byteOrderProp =
        {
          name = "byte-order",
          gtype = fn () => C.gtype GioDataStreamByteOrder.t (),
          get = fn x => fn () => C.get GioDataStreamByteOrder.t x,
          set = fn x => C.set GioDataStreamByteOrder.t x,
          init = fn x => C.set GioDataStreamByteOrder.t x
        }
    end
  end
