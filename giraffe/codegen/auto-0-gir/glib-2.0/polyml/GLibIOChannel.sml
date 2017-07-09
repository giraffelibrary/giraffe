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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_io_channel_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFile_ =
        call (getSymbol "g_io_channel_new_file")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOChannelRecord.PolyML.cPtr
          )
      val unixNew_ = call (getSymbol "g_io_channel_unix_new") (GInt.PolyML.cVal --> GLibIOChannelRecord.PolyML.cPtr)
      val close_ = call (getSymbol "g_io_channel_close") (GLibIOChannelRecord.PolyML.cPtr --> cVoid)
      val flush_ = call (getSymbol "g_io_channel_flush") (GLibIOChannelRecord.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GLibIOStatus.PolyML.cVal)
      val getBufferCondition_ = call (getSymbol "g_io_channel_get_buffer_condition") (GLibIOChannelRecord.PolyML.cPtr --> GLibIOCondition.PolyML.cVal)
      val getBufferSize_ = call (getSymbol "g_io_channel_get_buffer_size") (GLibIOChannelRecord.PolyML.cPtr --> GSize.PolyML.cVal)
      val getBuffered_ = call (getSymbol "g_io_channel_get_buffered") (GLibIOChannelRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCloseOnUnref_ = call (getSymbol "g_io_channel_get_close_on_unref") (GLibIOChannelRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEncoding_ = call (getSymbol "g_io_channel_get_encoding") (GLibIOChannelRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (getSymbol "g_io_channel_get_flags") (GLibIOChannelRecord.PolyML.cPtr --> GLibIOFlags.PolyML.cVal)
      val init_ = call (getSymbol "g_io_channel_init") (GLibIOChannelRecord.PolyML.cPtr --> cVoid)
      val seek_ =
        call (getSymbol "g_io_channel_seek")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GLibSeekType.PolyML.cVal
             --> GLibIOError.PolyML.cVal
          )
      val seekPosition_ =
        call (getSymbol "g_io_channel_seek_position")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GLibSeekType.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val setBufferSize_ = call (getSymbol "g_io_channel_set_buffer_size") (GLibIOChannelRecord.PolyML.cPtr &&> GSize.PolyML.cVal --> cVoid)
      val setBuffered_ = call (getSymbol "g_io_channel_set_buffered") (GLibIOChannelRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCloseOnUnref_ = call (getSymbol "g_io_channel_set_close_on_unref") (GLibIOChannelRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEncoding_ =
        call (getSymbol "g_io_channel_set_encoding")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val setFlags_ =
        call (getSymbol "g_io_channel_set_flags")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GLibIOFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val setLineTerm_ =
        call (getSymbol "g_io_channel_set_line_term")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val shutdown_ =
        call (getSymbol "g_io_channel_shutdown")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val unixGetFd_ = call (getSymbol "g_io_channel_unix_get_fd") (GLibIOChannelRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val writeUnichar_ =
        call (getSymbol "g_io_channel_write_unichar")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GChar.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val errorFromErrno_ = call (getSymbol "g_io_channel_error_from_errno") (GInt.PolyML.cVal --> GLibIOChannelError.PolyML.cVal)
    end
    type t = GLibIOChannelRecord.t
    type i_o_condition_t = GLibIOCondition.t
    type i_o_error_t = GLibIOError.t
    type seek_type_t = GLibSeekType.t
    type i_o_flags_t = GLibIOFlags.t
    type i_o_status_t = GLibIOStatus.t
    type i_o_channel_error_t = GLibIOChannelError.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFile filename mode =
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
    fun unixNew fd = (GInt.FFI.withVal ---> GLibIOChannelRecord.FFI.fromPtr true) unixNew_ fd
    fun close self = (GLibIOChannelRecord.FFI.withPtr ---> I) close_ self
    fun flush self = (GLibIOChannelRecord.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GLibIOStatus.FFI.fromVal) flush_ (self & [])
    fun getBufferCondition self = (GLibIOChannelRecord.FFI.withPtr ---> GLibIOCondition.FFI.fromVal) getBufferCondition_ self
    fun getBufferSize self = (GLibIOChannelRecord.FFI.withPtr ---> GSize.FFI.fromVal) getBufferSize_ self
    fun getBuffered self = (GLibIOChannelRecord.FFI.withPtr ---> GBool.FFI.fromVal) getBuffered_ self
    fun getCloseOnUnref self = (GLibIOChannelRecord.FFI.withPtr ---> GBool.FFI.fromVal) getCloseOnUnref_ self
    fun getEncoding self = (GLibIOChannelRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getEncoding_ self
    fun getFlags self = (GLibIOChannelRecord.FFI.withPtr ---> GLibIOFlags.FFI.fromVal) getFlags_ self
    fun init self = (GLibIOChannelRecord.FFI.withPtr ---> I) init_ self
    fun seek self offset type' =
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
    fun seekPosition self offset type' =
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
         &&&> Utf8.FFI.withPtr
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
    fun setLineTerm self lineTerm length =
      (
        GLibIOChannelRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
    fun unixGetFd self = (GLibIOChannelRecord.FFI.withPtr ---> GInt.FFI.fromVal) unixGetFd_ self
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
