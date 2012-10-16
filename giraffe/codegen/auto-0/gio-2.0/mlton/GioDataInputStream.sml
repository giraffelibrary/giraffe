structure GioDataInputStream :>
  GIO_DATA_INPUT_STREAM
    where type 'a class_t = 'a GioDataInputStreamClass.t
    where type 'a inputstreamclass_t = 'a GioInputStreamClass.t
    where type 'a cancellableclass_t = 'a GioCancellableClass.t
    where type 'a asyncresultclass_t = 'a GioAsyncResultClass.t
    where type datastreambyteorder_t = GioDataStreamByteOrder.t
    where type datastreamnewlinetype_t = GioDataStreamNewlineType.t =
  struct
    val getType_ = _import "g_data_input_stream_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_data_input_stream_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getByteOrder_ = _import "g_data_input_stream_get_byte_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDataStreamByteOrder.C.val_;
    val getNewlineType_ = _import "g_data_input_stream_get_newline_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDataStreamNewlineType.C.val_;
    val readByte_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_data_input_stream_read_byte" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Word8.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int16.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int32.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int64.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Word64.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.notnull FFI.String.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Word64.ref_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.notnull FFI.String.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Word16.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Word32.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Word64.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Word64.ref_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.notnull FFI.String.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Word64.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.notnull FFI.String.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int64.val_
               * FFI.Word64.ref_
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.notnull FFI.String.out_p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Word64.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.String.notnull FFI.String.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setByteOrder_ = fn x1 & x2 => (_import "g_data_input_stream_set_byte_order" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioDataStreamByteOrder.C.val_ -> unit;) (x1, x2)
    val setNewlineType_ = fn x1 & x2 => (_import "g_data_input_stream_set_newline_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GioDataStreamNewlineType.C.val_ -> unit;) (x1, x2)
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
         ---> FFI.Word8.fromVal
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
             &&&> FFI.Word64.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Word64.fromVal && FFI.String.fromPtr true
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
             &&&> FFI.Word64.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Word64.fromVal && FFI.String.fromPtr true
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
         ---> FFI.Word16.fromVal
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
         ---> FFI.Word32.fromVal
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
         ---> FFI.Word64.fromVal
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
             &&&> FFI.Word64.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Word64.fromVal && FFI.String.fromPtr true
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
             &&&> FFI.Word64.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Word64.fromVal && FFI.String.fromPtr true
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
             &&&> FFI.Word64.withRefVal
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Word64.fromVal && FFI.String.fromPtr true
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
             &&&> FFI.Word64.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Word64.fromVal && FFI.String.fromPtr true
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
