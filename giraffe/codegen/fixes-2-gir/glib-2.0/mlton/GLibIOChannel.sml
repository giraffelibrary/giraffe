structure GLibIOChannel :>
  G_LIB_I_O_CHANNEL
    where type t = GLibIOChannelRecord.t
    where type i_o_condition_t = GLibIOCondition.t
    where type i_o_error_t = GLibIOError.t
    where type seek_type_t = GLibSeekType.t
    where type i_o_flags_t = GLibIOFlags.t
    where type i_o_status_t = GLibIOStatus.t
    where type i_o_channel_error_t = GLibIOChannelError.t =
  struct
    val getType_ = _import "g_io_channel_get_type" : unit -> GObjectType.FFI.val_;
    val newFile_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_io_channel_new_file" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val unixNew_ = _import "g_io_channel_unix_new" : GFileDesc.FFI.val_ -> GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p;
    val close_ = _import "g_io_channel_close" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> unit;
    val flush_ = fn x1 & x2 => (_import "g_io_channel_flush" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GLibIOStatus.FFI.val_;) (x1, x2)
    val getBufferCondition_ = _import "g_io_channel_get_buffer_condition" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GLibIOCondition.FFI.val_;
    val getBufferSize_ = _import "g_io_channel_get_buffer_size" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GSize.FFI.val_;
    val getBuffered_ = _import "g_io_channel_get_buffered" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GBool.FFI.val_;
    val getCloseOnUnref_ = _import "g_io_channel_get_close_on_unref" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GBool.FFI.val_;
    val getEncoding_ = _import "g_io_channel_get_encoding" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFlags_ = _import "g_io_channel_get_flags" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GLibIOFlags.FFI.val_;
    val init_ = _import "g_io_channel_init" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> unit;
    val readLine_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_io_channel_read_line" :
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * GSize.FFI.ref_
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibIOStatus.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val readToEnd_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_io_channel_read_to_end" :
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * GUInt8CArrayN.MLton.r1
               * (GUInt8CArrayN.FFI.opt, GUInt8CArrayN.FFI.non_opt) GUInt8CArrayN.MLton.r2
               * GSize.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibIOStatus.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val readUnichar_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_channel_read_unichar" :
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * GChar.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibIOStatus.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val seek_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_channel_seek" :
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * GInt64.FFI.val_
               * GLibSeekType.FFI.val_
               -> GLibIOError.FFI.val_;
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
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * GInt64.FFI.val_
               * GLibSeekType.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibIOStatus.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setBufferSize_ = fn x1 & x2 => (_import "g_io_channel_set_buffer_size" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p * GSize.FFI.val_ -> unit;) (x1, x2)
    val setBuffered_ = fn x1 & x2 => (_import "g_io_channel_set_buffered" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCloseOnUnref_ = fn x1 & x2 => (_import "g_io_channel_set_close_on_unref" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEncoding_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_io_channel_set_encoding" :
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibIOStatus.FFI.val_;
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
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * GLibIOFlags.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibIOStatus.FFI.val_;
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
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt.FFI.val_
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
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibIOStatus.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val unixGetFd_ = _import "g_io_channel_unix_get_fd" : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GFileDesc.FFI.val_;
    val writeUnichar_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_channel_write_unichar" :
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * GChar.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibIOStatus.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val errorFromErrno_ = _import "g_io_channel_error_from_errno" : GInt.FFI.val_ -> GLibIOChannelError.FFI.val_;
    type t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t
    type i_o_error_t = GLibIOError.t
    type seek_type_t = GLibSeekType.t
    type i_o_flags_t = GLibIOFlags.t
    type i_o_status_t = GLibIOStatus.t
    type i_o_channel_error_t = GLibIOChannelError.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFile (filename, mode) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibIOChannelRecord.FFI.fromPtr true
      )
        newFile_
        (
          filename
           & mode
           & []
        )
    fun unixNew fd = (GFileDesc.FFI.withVal ---> GLibIOChannelRecord.FFI.fromPtr true) unixNew_ fd
    fun close self = (GLibIOChannelRecord.FFI.withPtr ---> I) close_ self
    fun flush self = (GLibIOChannelRecord.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GLibIOStatus.FFI.fromVal) flush_ (self & [])
    fun getBufferCondition self = (GLibIOChannelRecord.FFI.withPtr ---> GLibIOCondition.FFI.fromVal) getBufferCondition_ self
    fun getBufferSize self = (GLibIOChannelRecord.FFI.withPtr ---> GSize.FFI.fromVal) getBufferSize_ self
    fun getBuffered self = (GLibIOChannelRecord.FFI.withPtr ---> GBool.FFI.fromVal) getBuffered_ self
    fun getCloseOnUnref self = (GLibIOChannelRecord.FFI.withPtr ---> GBool.FFI.fromVal) getCloseOnUnref_ self
    fun getEncoding self = (GLibIOChannelRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getEncoding_ self
    fun getFlags self = (GLibIOChannelRecord.FFI.withPtr ---> GLibIOFlags.FFI.fromVal) getFlags_ self
    fun init self = (GLibIOChannelRecord.FFI.withPtr ---> I) init_ self
    fun readLine self =
      let
        val strReturn
         & length
         & terminatorPos
         & retVal =
          (
            GLibIOChannelRecord.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1
                   && GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && GLibIOStatus.FFI.fromVal
          )
            readLine_
            (
              self
               & NONE
               & GSize.null
               & GSize.null
               & []
            )
      in
        (
          retVal,
          strReturn,
          length,
          terminatorPos
        )
      end
    fun readToEnd self =
      let
        val strReturn
         & length
         & retVal =
          (
            GLibIOChannelRecord.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withRefOptPtr
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr 1
                   && GSize.FFI.fromVal
                   && GLibIOStatus.FFI.fromVal
          )
            readToEnd_
            (
              self
               & NONE
               & GSize.null
               & []
            )
      in
        (retVal, strReturn length)
      end
    fun readUnichar self =
      let
        val thechar & retVal =
          (
            GLibIOChannelRecord.FFI.withPtr
             &&&> GChar.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GChar.FFI.fromVal && GLibIOStatus.FFI.fromVal
          )
            readUnichar_
            (
              self
               & GChar.null
               & []
            )
      in
        (retVal, thechar)
      end
    fun seek self (offset, type') =
      (
        GLibIOChannelRecord.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GLibSeekType.FFI.withVal
         ---> GLibIOError.FFI.fromVal
      )
        seek_
        (
          self
           & offset
           & type'
        )
    fun seekPosition self (offset, type') =
      (
        GLibIOChannelRecord.FFI.withPtr
         &&&> GInt64.FFI.withVal
         &&&> GLibSeekType.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
      )
        seekPosition_
        (
          self
           & offset
           & type'
           & []
        )
    fun setBufferSize self size = (GLibIOChannelRecord.FFI.withPtr &&&> GSize.FFI.withVal ---> I) setBufferSize_ (self & size)
    fun setBuffered self buffered = (GLibIOChannelRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setBuffered_ (self & buffered)
    fun setCloseOnUnref self doClose = (GLibIOChannelRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCloseOnUnref_ (self & doClose)
    fun setEncoding self encoding =
      (
        GLibIOChannelRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
      )
        setEncoding_
        (
          self
           & encoding
           & []
        )
    fun setFlags self flags =
      (
        GLibIOChannelRecord.FFI.withPtr
         &&&> GLibIOFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
      )
        setFlags_
        (
          self
           & flags
           & []
        )
    fun setLineTerm self (lineTerm, length) =
      (
        GLibIOChannelRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GInt.FFI.withVal
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
        GLibIOChannelRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
      )
        shutdown_
        (
          self
           & flush
           & []
        )
    fun unixGetFd self = (GLibIOChannelRecord.FFI.withPtr ---> GFileDesc.FFI.fromVal) unixGetFd_ self
    fun writeUnichar self thechar =
      (
        GLibIOChannelRecord.FFI.withPtr
         &&&> GChar.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
      )
        writeUnichar_
        (
          self
           & thechar
           & []
        )
    fun errorFromErrno en = (GInt.FFI.withVal ---> GLibIOChannelError.FFI.fromVal) errorFromErrno_ en
  end
