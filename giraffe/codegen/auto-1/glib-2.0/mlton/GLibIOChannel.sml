structure GLibIOChannel :>
  G_LIB_I_O_CHANNEL
    where type record_t = GLibIOChannelRecord.t
    where type iocondition_t = GLibIOCondition.t
    where type ioerror_t = GLibIOError.t
    where type seektype_t = GLibSeekType.t
    where type ioflags_t = GLibIOFlags.t
    where type iostatus_t = GLibIOStatus.t
    where type iochannelerror_t = GLibIOChannelError.t =
  struct
    val getType_ = _import "g_io_channel_get_type" : unit -> GObjectType.C.val_;
    val newFile_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_io_channel_new_file" :
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val unixNew_ = _import "g_io_channel_unix_new" : FFI.Int32.val_ -> GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p;
    val close_ = _import "g_io_channel_close" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> unit;
    val flush_ = fn x1 & x2 => (_import "g_io_channel_flush" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * (unit, unit) GLibErrorRecord.C.r -> GLibIOStatus.C.val_;) (x1, x2)
    val getBufferCondition_ = _import "g_io_channel_get_buffer_condition" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> GLibIOCondition.C.val_;
    val getBufferSize_ = _import "g_io_channel_get_buffer_size" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> FFI.Word64.val_;
    val getBuffered_ = _import "g_io_channel_get_buffered" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> FFI.Bool.val_;
    val getCloseOnUnref_ = _import "g_io_channel_get_close_on_unref" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> FFI.Bool.val_;
    val getEncoding_ = _import "g_io_channel_get_encoding" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val getFlags_ = _import "g_io_channel_get_flags" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> GLibIOFlags.C.val_;
    val init_ = _import "g_io_channel_init" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> unit;
    val seek_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_channel_seek" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * FFI.Int64.val_
               * GLibSeekType.C.val_
               -> GLibIOError.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val seekPosition_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_io_channel_seek_position" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * FFI.Int64.val_
               * GLibSeekType.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibIOStatus.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setBufferSize_ = fn x1 & x2 => (_import "g_io_channel_set_buffer_size" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * FFI.Word64.val_ -> unit;) (x1, x2)
    val setBuffered_ = fn x1 & x2 => (_import "g_io_channel_set_buffered" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setCloseOnUnref_ = fn x1 & x2 => (_import "g_io_channel_set_close_on_unref" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setEncoding_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_io_channel_set_encoding" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibIOStatus.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setFlags_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_channel_set_flags" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * GLibIOFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibIOStatus.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setLineTerm_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_io_channel_set_line_term" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * cstring
               * unit CPointer.t
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val shutdown_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_channel_shutdown" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * FFI.Bool.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibIOStatus.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unixGetFd_ = _import "g_io_channel_unix_get_fd" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> FFI.Int32.val_;
    val writeUnichar_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_channel_write_unichar" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * FFI.Char.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibIOStatus.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val errorFromErrno_ = _import "g_io_channel_error_from_errno" : FFI.Int32.val_ -> GLibIOChannelError.C.val_;
    type record_t = GLibIOChannelRecord.t
    type iocondition_t = GLibIOCondition.t
    type ioerror_t = GLibIOError.t
    type seektype_t = GLibSeekType.t
    type ioflags_t = GLibIOFlags.t
    type iostatus_t = GLibIOStatus.t
    type iochannelerror_t = GLibIOChannelError.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFile filename mode =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GLibIOChannelRecord.C.fromPtr true
      )
        newFile_
        (
          filename
           & mode
           & []
        )
    fun unixNew fd = (FFI.Int32.withVal ---> GLibIOChannelRecord.C.fromPtr true) unixNew_ fd
    fun close self = (GLibIOChannelRecord.C.withPtr ---> I) close_ self
    fun flush self = (GLibIOChannelRecord.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GLibIOStatus.C.fromVal) flush_ (self & [])
    fun getBufferCondition self = (GLibIOChannelRecord.C.withPtr ---> GLibIOCondition.C.fromVal) getBufferCondition_ self
    fun getBufferSize self = (GLibIOChannelRecord.C.withPtr ---> FFI.Word64.fromVal) getBufferSize_ self
    fun getBuffered self = (GLibIOChannelRecord.C.withPtr ---> FFI.Bool.fromVal) getBuffered_ self
    fun getCloseOnUnref self = (GLibIOChannelRecord.C.withPtr ---> FFI.Bool.fromVal) getCloseOnUnref_ self
    fun getEncoding self = (GLibIOChannelRecord.C.withPtr ---> FFI.String.fromPtr false) getEncoding_ self
    fun getFlags self = (GLibIOChannelRecord.C.withPtr ---> GLibIOFlags.C.fromVal) getFlags_ self
    fun init self = (GLibIOChannelRecord.C.withPtr ---> I) init_ self
    fun seek self offset type' =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.Int64.withVal
         &&&> GLibSeekType.C.withVal
         ---> GLibIOError.C.fromVal
      )
        seek_
        (
          self
           & offset
           & type'
        )
    fun seekPosition self offset type' =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.Int64.withVal
         &&&> GLibSeekType.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GLibIOStatus.C.fromVal
      )
        seekPosition_
        (
          self
           & offset
           & type'
           & []
        )
    fun setBufferSize self size = (GLibIOChannelRecord.C.withPtr &&&> FFI.Word64.withVal ---> I) setBufferSize_ (self & size)
    fun setBuffered self buffered = (GLibIOChannelRecord.C.withPtr &&&> FFI.Bool.withVal ---> I) setBuffered_ (self & buffered)
    fun setCloseOnUnref self doClose = (GLibIOChannelRecord.C.withPtr &&&> FFI.Bool.withVal ---> I) setCloseOnUnref_ (self & doClose)
    fun setEncoding self encoding =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GLibIOStatus.C.fromVal
      )
        setEncoding_
        (
          self
           & encoding
           & []
        )
    fun setFlags self flags =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> GLibIOFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GLibIOStatus.C.fromVal
      )
        setFlags_
        (
          self
           & flags
           & []
        )
    fun setLineTerm self lineTerm length =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         ---> I
      )
        setLineTerm_
        (
          self
           & lineTerm
           & length
        )
    fun shutdown self flush =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.Bool.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GLibIOStatus.C.fromVal
      )
        shutdown_
        (
          self
           & flush
           & []
        )
    fun unixGetFd self = (GLibIOChannelRecord.C.withPtr ---> FFI.Int32.fromVal) unixGetFd_ self
    fun writeUnichar self thechar =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.Char.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GLibIOStatus.C.fromVal
      )
        writeUnichar_
        (
          self
           & thechar
           & []
        )
    fun errorFromErrno en = (FFI.Int32.withVal ---> GLibIOChannelError.C.fromVal) errorFromErrno_ en
  end
