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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_io_channel_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newFile_ =
        call (load_sym libglib "g_io_channel_new_file")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibIOChannelRecord.PolyML.PTR
          )
      val unixNew_ = call (load_sym libglib "g_io_channel_unix_new") (FFI.Int32.PolyML.VAL --> GLibIOChannelRecord.PolyML.PTR)
      val close_ = call (load_sym libglib "g_io_channel_close") (GLibIOChannelRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val flush_ = call (load_sym libglib "g_io_channel_flush") (GLibIOChannelRecord.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GLibIOStatus.PolyML.VAL)
      val getBufferCondition_ = call (load_sym libglib "g_io_channel_get_buffer_condition") (GLibIOChannelRecord.PolyML.PTR --> GLibIOCondition.PolyML.VAL)
      val getBufferSize_ = call (load_sym libglib "g_io_channel_get_buffer_size") (GLibIOChannelRecord.PolyML.PTR --> FFI.UInt64.PolyML.VAL)
      val getBuffered_ = call (load_sym libglib "g_io_channel_get_buffered") (GLibIOChannelRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getCloseOnUnref_ = call (load_sym libglib "g_io_channel_get_close_on_unref") (GLibIOChannelRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getEncoding_ = call (load_sym libglib "g_io_channel_get_encoding") (GLibIOChannelRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getFlags_ = call (load_sym libglib "g_io_channel_get_flags") (GLibIOChannelRecord.PolyML.PTR --> GLibIOFlags.PolyML.VAL)
      val init_ = call (load_sym libglib "g_io_channel_init") (GLibIOChannelRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val seek_ =
        call (load_sym libglib "g_io_channel_seek")
          (
            GLibIOChannelRecord.PolyML.PTR
             &&> FFI.Int64.PolyML.VAL
             &&> GLibSeekType.PolyML.VAL
             --> GLibIOError.PolyML.VAL
          )
      val seekPosition_ =
        call (load_sym libglib "g_io_channel_seek_position")
          (
            GLibIOChannelRecord.PolyML.PTR
             &&> FFI.Int64.PolyML.VAL
             &&> GLibSeekType.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibIOStatus.PolyML.VAL
          )
      val setBufferSize_ = call (load_sym libglib "g_io_channel_set_buffer_size") (GLibIOChannelRecord.PolyML.PTR &&> FFI.UInt64.PolyML.VAL --> FFI.PolyML.VOID)
      val setBuffered_ = call (load_sym libglib "g_io_channel_set_buffered") (GLibIOChannelRecord.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setCloseOnUnref_ = call (load_sym libglib "g_io_channel_set_close_on_unref") (GLibIOChannelRecord.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setEncoding_ =
        call (load_sym libglib "g_io_channel_set_encoding")
          (
            GLibIOChannelRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibIOStatus.PolyML.VAL
          )
      val setFlags_ =
        call (load_sym libglib "g_io_channel_set_flags")
          (
            GLibIOChannelRecord.PolyML.PTR
             &&> GLibIOFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibIOStatus.PolyML.VAL
          )
      val setLineTerm_ =
        call (load_sym libglib "g_io_channel_set_line_term")
          (
            GLibIOChannelRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val shutdown_ =
        call (load_sym libglib "g_io_channel_shutdown")
          (
            GLibIOChannelRecord.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibIOStatus.PolyML.VAL
          )
      val unixGetFd_ = call (load_sym libglib "g_io_channel_unix_get_fd") (GLibIOChannelRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val writeUnichar_ =
        call (load_sym libglib "g_io_channel_write_unichar")
          (
            GLibIOChannelRecord.PolyML.PTR
             &&> FFI.Char.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GLibIOStatus.PolyML.VAL
          )
      val errorFromErrno_ = call (load_sym libglib "g_io_channel_error_from_errno") (FFI.Int32.PolyML.VAL --> GLibIOChannelError.PolyML.VAL)
    end
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
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GLibIOChannelRecord.C.fromPtr true
      )
        newFile_
        (
          filename
           & mode
           & []
        )
    fun unixNew fd = (FFI.Int32.C.withVal ---> GLibIOChannelRecord.C.fromPtr true) unixNew_ fd
    fun close self = (GLibIOChannelRecord.C.withPtr ---> I) close_ self
    fun flush self = (GLibIOChannelRecord.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GLibIOStatus.C.fromVal) flush_ (self & [])
    fun getBufferCondition self = (GLibIOChannelRecord.C.withPtr ---> GLibIOCondition.C.fromVal) getBufferCondition_ self
    fun getBufferSize self = (GLibIOChannelRecord.C.withPtr ---> FFI.UInt64.C.fromVal) getBufferSize_ self
    fun getBuffered self = (GLibIOChannelRecord.C.withPtr ---> FFI.Bool.C.fromVal) getBuffered_ self
    fun getCloseOnUnref self = (GLibIOChannelRecord.C.withPtr ---> FFI.Bool.C.fromVal) getCloseOnUnref_ self
    fun getEncoding self = (GLibIOChannelRecord.C.withPtr ---> FFI.String.C.fromPtr false) getEncoding_ self
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
    fun setBufferSize self size = (GLibIOChannelRecord.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) setBufferSize_ (self & size)
    fun setBuffered self buffered = (GLibIOChannelRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setBuffered_ (self & buffered)
    fun setCloseOnUnref self doClose = (GLibIOChannelRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCloseOnUnref_ (self & doClose)
    fun setEncoding self encoding =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.Int32.C.withVal
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
         &&&> GLibErrorRecord.C.handleError
         ---> GLibIOStatus.C.fromVal
      )
        shutdown_
        (
          self
           & flush
           & []
        )
    fun unixGetFd self = (GLibIOChannelRecord.C.withPtr ---> FFI.Int32.C.fromVal) unixGetFd_ self
    fun writeUnichar self thechar =
      (
        GLibIOChannelRecord.C.withPtr
         &&&> FFI.Char.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GLibIOStatus.C.fromVal
      )
        writeUnichar_
        (
          self
           & thechar
           & []
        )
    fun errorFromErrno en = (FFI.Int32.C.withVal ---> GLibIOChannelError.C.fromVal) errorFromErrno_ en
  end
