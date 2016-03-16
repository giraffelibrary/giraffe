structure GLibIOChannel :>
  G_LIB_I_O_CHANNEL
    where type record_t = GLibIOChannelRecord.t
    where type i_o_condition_t = GLibIOCondition.t
    where type i_o_error_t = GLibIOError.t
    where type seek_type_t = GLibSeekType.t
    where type i_o_flags_t = GLibIOFlags.t
    where type i_o_status_t = GLibIOStatus.t
    where type i_o_channel_error_t = GLibIOChannelError.t =
  struct
    val getType_ = _import "g_io_channel_get_type" : unit -> GObjectType.C.val_;
    val newFile_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_io_channel_new_file" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
    val unixNew_ = _import "g_io_channel_unix_new" : FFI.Int.C.val_ -> GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p;
    val close_ = _import "g_io_channel_close" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> unit;
    val flush_ = fn x1 & x2 => (_import "g_io_channel_flush" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * (unit, unit) GLibErrorRecord.C.r -> GLibIOStatus.C.val_;) (x1, x2)
    val getBufferCondition_ = _import "g_io_channel_get_buffer_condition" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> GLibIOCondition.C.val_;
    val getBufferSize_ = _import "g_io_channel_get_buffer_size" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> FFI.Size.C.val_;
    val getBuffered_ = _import "g_io_channel_get_buffered" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> FFI.Bool.C.val_;
    val getCloseOnUnref_ = _import "g_io_channel_get_close_on_unref" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> FFI.Bool.C.val_;
    val getEncoding_ = _import "g_io_channel_get_encoding" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
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
               * FFI.Int64.C.val_
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
               * FFI.Int64.C.val_
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
    val setBufferSize_ = fn x1 & x2 => (_import "g_io_channel_set_buffer_size" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * FFI.Size.C.val_ -> unit;) (x1, x2)
    val setBuffered_ = fn x1 & x2 => (_import "g_io_channel_set_buffered" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setCloseOnUnref_ = fn x1 & x2 => (_import "g_io_channel_set_close_on_unref" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setEncoding_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_io_channel_set_encoding" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
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
               * FFI.Bool.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibIOStatus.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unixGetFd_ = _import "g_io_channel_unix_get_fd" : GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p -> FFI.Int.C.val_;
    val writeUnichar_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_channel_write_unichar" :
              GLibIOChannelRecord.C.notnull GLibIOChannelRecord.C.p
               * FFI.Char.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GLibIOStatus.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val errorFromErrno_ = _import "g_io_channel_error_from_errno" : FFI.Int.C.val_ -> GLibIOChannelError.C.val_;
    type record_t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t
    type i_o_error_t = GLibIOError.t
    type seek_type_t = GLibSeekType.t
    type i_o_flags_t = GLibIOFlags.t
    type i_o_status_t = GLibIOStatus.t
    type i_o_channel_error_t = GLibIOChannelError.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFile filename mode =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibIOChannelRecord.C.fromPtr true
      )
        newFile_
        (
          filename
           & mode
           & []
        )
    fun unixNew fd = (FFI.Int.C.withVal ---> GLibIOChannelRecord.C.fromPtr true) unixNew_ fd
    fun close self = (GLibIOChannelRecord.C.withPtr ---> I) close_ self
    fun flush self = (GLibIOChannelRecord.C.withPtr &&&> GLibErrorRecord.handleError ---> GLibIOStatus.C.fromVal) flush_ (self & [])
    fun getBufferCondition self = (GLibIOChannelRecord.C.withPtr ---> GLibIOCondition.C.fromVal) getBufferCondition_ self
    fun getBufferSize self = (GLibIOChannelRecord.C.withPtr ---> FFI.Size.C.fromVal) getBufferSize_ self
    fun getBuffered self = (GLibIOChannelRecord.C.withPtr ---> FFI.Bool.C.fromVal) getBuffered_ self
    fun getCloseOnUnref self = (GLibIOChannelRecord.C.withPtr ---> FFI.Bool.C.fromVal) getCloseOnUnref_ self
    fun getEncoding self = (GLibIOChannelRecord.C.withPtr ---> Utf8.C.fromPtr false) getEncoding_ self
    fun getFlags self = (GLibIOChannelRecord.C.withPtr ---> GLibIOFlags.C.fromVal) getFlags_ self
    fun init self = (GLibIOChannelRecord.C.withPtr ---> I) init_ self
    fun seek self offset type' =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.Int64.C.withVal
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
         &&&> FFI.Int64.C.withVal
         &&&> GLibSeekType.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.C.fromVal
      )
        seekPosition_
        (
          self
           & offset
           & type'
           & []
        )
    fun setBufferSize self size = (GLibIOChannelRecord.C.withPtr &&&> FFI.Size.C.withVal ---> I) setBufferSize_ (self & size)
    fun setBuffered self buffered = (GLibIOChannelRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setBuffered_ (self & buffered)
    fun setCloseOnUnref self doClose = (GLibIOChannelRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseOnUnref_ (self & doClose)
    fun setEncoding self encoding =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
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
         &&&> GLibErrorRecord.handleError
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
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Bool.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.C.fromVal
      )
        shutdown_
        (
          self
           & flush
           & []
        )
    fun unixGetFd self = (GLibIOChannelRecord.C.withPtr ---> FFI.Int.C.fromVal) unixGetFd_ self
    fun writeUnichar self thechar =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.Char.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.C.fromVal
      )
        writeUnichar_
        (
          self
           & thechar
           & []
        )
    fun errorFromErrno en = (FFI.Int.C.withVal ---> GLibIOChannelError.C.fromVal) errorFromErrno_ en
  end
