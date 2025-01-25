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
            _import "mlton_g_io_channel_new_file" reentrant :
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
    val unixNew_ = _import "g_io_channel_unix_new" reentrant : GFileDesc.FFI.val_ -> GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p;
    val close_ = _import "g_io_channel_close" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> unit;
    val flush_ = fn x1 & x2 => (_import "g_io_channel_flush" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GLibIOStatus.FFI.val_;) (x1, x2)
    val getBufferCondition_ = _import "g_io_channel_get_buffer_condition" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GLibIOCondition.FFI.val_;
    val getBufferSize_ = _import "g_io_channel_get_buffer_size" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GSize.FFI.val_;
    val getBuffered_ = _import "g_io_channel_get_buffered" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GBool.FFI.val_;
    val getCloseOnUnref_ = _import "g_io_channel_get_close_on_unref" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GBool.FFI.val_;
    val getEncoding_ = _import "g_io_channel_get_encoding" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getFlags_ = _import "g_io_channel_get_flags" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GLibIOFlags.FFI.val_;
    val init_ = _import "g_io_channel_init" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> unit;
    val readChars_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_io_channel_read_chars" reentrant :
              GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
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
    val readLine_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_g_io_channel_read_line" reentrant :
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
            _import "mlton_g_io_channel_read_to_end" reentrant :
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
            _import "g_io_channel_read_unichar" reentrant :
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
            _import "g_io_channel_seek" reentrant :
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
            _import "g_io_channel_seek_position" reentrant :
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
    val setBufferSize_ = fn x1 & x2 => (_import "g_io_channel_set_buffer_size" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p * GSize.FFI.val_ -> unit;) (x1, x2)
    val setBuffered_ = fn x1 & x2 => (_import "g_io_channel_set_buffered" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCloseOnUnref_ = fn x1 & x2 => (_import "g_io_channel_set_close_on_unref" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEncoding_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_io_channel_set_encoding" reentrant :
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
            _import "g_io_channel_set_flags" reentrant :
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
            _import "mlton_g_io_channel_set_line_term" reentrant :
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
            _import "g_io_channel_shutdown" reentrant :
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
    val unixGetFd_ = _import "g_io_channel_unix_get_fd" reentrant : GLibIOChannelRecord.FFI.non_opt GLibIOChannelRecord.FFI.p -> GFileDesc.FFI.val_;
    val writeUnichar_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_io_channel_write_unichar" reentrant :
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
    val errorFromErrno_ = _import "g_io_channel_error_from_errno" reentrant : GInt.FFI.val_ -> GLibIOChannelError.FFI.val_;
    type t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t
    type i_o_error_t = GLibIOError.t
    type seek_type_t = GLibSeekType.t
    type i_o_flags_t = GLibIOFlags.t
    type i_o_status_t = GLibIOStatus.t
    type i_o_channel_error_t = GLibIOChannelError.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      val call =
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GLibIOChannelRecord.FFI.fromPtr true
    in
      fun newFile (filename, mode) =
        call newFile_
          (
            filename
             & mode
             & []
          )
    end
    local
      val call = GFileDesc.FFI.withVal ---> GLibIOChannelRecord.FFI.fromPtr true
    in
      fun unixNew fd = call unixNew_ fd
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false ---> I
    in
      fun close self = call close_ self
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GLibIOStatus.FFI.fromVal
    in
      fun flush self = call flush_ (self & [])
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false ---> GLibIOCondition.FFI.fromVal
    in
      fun getBufferCondition self = call getBufferCondition_ self
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false ---> GSize.FFI.fromVal
    in
      fun getBufferSize self = call getBufferSize_ self
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getBuffered self = call getBuffered_ self
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getCloseOnUnref self = call getCloseOnUnref_ self
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getEncoding self = call getEncoding_ self before GLibIOChannelRecord.FFI.touchPtr self
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false ---> GLibIOFlags.FFI.fromVal
    in
      fun getFlags self = call getFlags_ self
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false ---> I
    in
      fun init self = call init_ self
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GUInt8CArrayN.FFI.withNewPtr
         &&&> GSize.FFI.withVal
         &&&> GSize.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt8CArrayN.FFI.fromPtr ~1
               && GSize.FFI.fromVal
               && GLibIOStatus.FFI.fromVal
    in
      fun readChars self count =
        let
          val buf
           & bytesRead
           & retVal =
            call readChars_
              (
                self
                 & count
                 & count
                 & GSize.null
                 & []
              )
        in
          (
            retVal,
            buf count,
            bytesRead
          )
        end
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> Utf8.FFI.withRefOptPtr 0
         &&&> GSize.FFI.withRefVal
         &&&> GSize.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> Utf8.FFI.fromPtr ~1
               && GSize.FFI.fromVal
               && GSize.FFI.fromVal
               && GLibIOStatus.FFI.fromVal
    in
      fun readLine self =
        let
          val strReturn
           & length
           & terminatorPos
           & retVal =
            call readLine_
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
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
         &&&> GSize.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GUInt8CArrayN.FFI.fromPtr ~1
               && GSize.FFI.fromVal
               && GLibIOStatus.FFI.fromVal
    in
      fun readToEnd self =
        let
          val strReturn
           & length
           & retVal =
            call readToEnd_
              (
                self
                 & NONE
                 & GSize.null
                 & []
              )
        in
          (retVal, strReturn length)
        end
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GChar.FFI.withRefVal
         &&&> GLibErrorRecord.handleError
         ---> GChar.FFI.fromVal && GLibIOStatus.FFI.fromVal
    in
      fun readUnichar self =
        let
          val thechar & retVal =
            call readUnichar_
              (
                self
                 & GChar.null
                 & []
              )
        in
          (retVal, thechar)
        end
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GInt64.FFI.withVal
         &&&> GLibSeekType.FFI.withVal
         ---> GLibIOError.FFI.fromVal
    in
      fun seek self (offset, type') =
        call seek_
          (
            self
             & offset
             & type'
          )
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GInt64.FFI.withVal
         &&&> GLibSeekType.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
    in
      fun seekPosition self (offset, type') =
        call seekPosition_
          (
            self
             & offset
             & type'
             & []
          )
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false &&&> GSize.FFI.withVal ---> I
    in
      fun setBufferSize self size = call setBufferSize_ (self & size)
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setBuffered self buffered = call setBuffered_ (self & buffered)
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setCloseOnUnref self doClose = call setCloseOnUnref_ (self & doClose)
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
    in
      fun setEncoding self encoding =
        call setEncoding_
          (
            self
             & encoding
             & []
          )
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GLibIOFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
    in
      fun setFlags self flags =
        call setFlags_
          (
            self
             & flags
             & []
          )
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GInt.FFI.withVal
         ---> I
    in
      fun setLineTerm self (lineTerm, length) =
        call setLineTerm_
          (
            self
             & lineTerm
             & length
          )
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
    in
      fun shutdown self flush =
        call shutdown_
          (
            self
             & flush
             & []
          )
    end
    local
      val call = GLibIOChannelRecord.FFI.withPtr false ---> GFileDesc.FFI.fromVal
    in
      fun unixGetFd self = call unixGetFd_ self
    end
    local
      val call =
        GLibIOChannelRecord.FFI.withPtr false
         &&&> GChar.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibIOStatus.FFI.fromVal
    in
      fun writeUnichar self thechar =
        call writeUnichar_
          (
            self
             & thechar
             & []
          )
    end
    local
      val call = GInt.FFI.withVal ---> GLibIOChannelError.FFI.fromVal
    in
      fun errorFromErrno en = call errorFromErrno_ en
    end
  end
