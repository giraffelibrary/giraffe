structure GioDataInputStream :>
  GIO_DATA_INPUT_STREAM
    where type 'a class = 'a GioDataInputStreamClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type data_stream_byte_order_t = GioDataStreamByteOrder.t
    where type data_stream_newline_type_t = GioDataStreamNewlineType.t =
  struct
    val getType_ = _import "g_data_input_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_data_input_stream_new" : GioInputStreamClass.C.notnull GioInputStreamClass.C.p -> GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p;
    val getByteOrder_ = _import "g_data_input_stream_get_byte_order" : GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p -> GioDataStreamByteOrder.C.val_;
    val getNewlineType_ = _import "g_data_input_stream_get_newline_type" : GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p -> GioDataStreamNewlineType.C.val_;
    val readByte_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_byte" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt8.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readInt16_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_int16" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int16.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readInt32_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_int32" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readInt64_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_int64" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readLineFinishUtf8_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_line_finish_utf8" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * FFI.Size.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readLineUtf8_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_line_utf8" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * FFI.Size.C.ref_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readUint16_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_uint16" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt16.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readUint32_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_uint32" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readUint64_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_uint64" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.UInt64.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val readUntil_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_data_input_stream_read_until" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Size.C.ref_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val readUntilFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_until_finish" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * FFI.Size.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val readUpto_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_data_input_stream_read_upto" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.SSize.C.val_
               * FFI.Size.C.ref_
               * unit GioCancellableClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val readUptoFinish_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_data_input_stream_read_upto_finish" :
              GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p
               * GioAsyncResultClass.C.notnull GioAsyncResultClass.C.p
               * FFI.Size.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setByteOrder_ = fn x1 & x2 => (_import "g_data_input_stream_set_byte_order" : GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p * GioDataStreamByteOrder.C.val_ -> unit;) (x1, x2)
    val setNewlineType_ = fn x1 & x2 => (_import "g_data_input_stream_set_newline_type" : GioDataInputStreamClass.C.notnull GioDataInputStreamClass.C.p * GioDataStreamNewlineType.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioDataInputStreamClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type data_stream_byte_order_t = GioDataStreamByteOrder.t
    type data_stream_newline_type_t = GioDataStreamNewlineType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseStream = (GioInputStreamClass.C.withPtr ---> GioDataInputStreamClass.C.fromPtr true) new_ baseStream
    fun getByteOrder self = (GioDataInputStreamClass.C.withPtr ---> GioDataStreamByteOrder.C.fromVal) getByteOrder_ self
    fun getNewlineType self = (GioDataInputStreamClass.C.withPtr ---> GioDataStreamNewlineType.C.fromVal) getNewlineType_ self
    fun readByte self cancellable =
      (
        GioDataInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioDataInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioDataInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioDataInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
            GioDataInputStreamClass.C.withPtr
             &&&> GioAsyncResultClass.C.withPtr
             &&&> FFI.Size.C.withRefVal
             &&&> GLibErrorRecord.handleError
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
            GioDataInputStreamClass.C.withPtr
             &&&> FFI.Size.C.withRefVal
             &&&> GioCancellableClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
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
        GioDataInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioDataInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
        GioDataInputStreamClass.C.withPtr
         &&&> GioCancellableClass.C.withOptPtr
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
            GioDataInputStreamClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> FFI.Size.C.withRefVal
             &&&> GioCancellableClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
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
            GioDataInputStreamClass.C.withPtr
             &&&> GioAsyncResultClass.C.withPtr
             &&&> FFI.Size.C.withRefVal
             &&&> GLibErrorRecord.handleError
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
            GioDataInputStreamClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> FFI.SSize.C.withVal
             &&&> FFI.Size.C.withRefVal
             &&&> GioCancellableClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
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
            GioDataInputStreamClass.C.withPtr
             &&&> GioAsyncResultClass.C.withPtr
             &&&> FFI.Size.C.withRefVal
             &&&> GLibErrorRecord.handleError
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
    fun setByteOrder self order = (GioDataInputStreamClass.C.withPtr &&&> GioDataStreamByteOrder.C.withVal ---> I) setByteOrder_ (self & order)
    fun setNewlineType self type' = (GioDataInputStreamClass.C.withPtr &&&> GioDataStreamNewlineType.C.withVal ---> I) setNewlineType_ (self & type')
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
