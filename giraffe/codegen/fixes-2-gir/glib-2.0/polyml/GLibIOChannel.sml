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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_io_channel_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val newFile_ =
        call (load_sym libglib "g_io_channel_new_file")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOChannelRecord.PolyML.cPtr
          )
      val unixNew_ = call (load_sym libglib "g_io_channel_unix_new") (FileDesc.PolyML.cVal --> GLibIOChannelRecord.PolyML.cPtr)
      val close_ = call (load_sym libglib "g_io_channel_close") (GLibIOChannelRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val flush_ = call (load_sym libglib "g_io_channel_flush") (GLibIOChannelRecord.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GLibIOStatus.PolyML.cVal)
      val getBufferCondition_ = call (load_sym libglib "g_io_channel_get_buffer_condition") (GLibIOChannelRecord.PolyML.cPtr --> GLibIOCondition.PolyML.cVal)
      val getBufferSize_ = call (load_sym libglib "g_io_channel_get_buffer_size") (GLibIOChannelRecord.PolyML.cPtr --> FFI.Size.PolyML.cVal)
      val getBuffered_ = call (load_sym libglib "g_io_channel_get_buffered") (GLibIOChannelRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCloseOnUnref_ = call (load_sym libglib "g_io_channel_get_close_on_unref") (GLibIOChannelRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getEncoding_ = call (load_sym libglib "g_io_channel_get_encoding") (GLibIOChannelRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (load_sym libglib "g_io_channel_get_flags") (GLibIOChannelRecord.PolyML.cPtr --> GLibIOFlags.PolyML.cVal)
      val init_ = call (load_sym libglib "g_io_channel_init") (GLibIOChannelRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val seek_ =
        call (load_sym libglib "g_io_channel_seek")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> FFI.Int64.PolyML.cVal
             &&> GLibSeekType.PolyML.cVal
             --> GLibIOError.PolyML.cVal
          )
      val seekPosition_ =
        call (load_sym libglib "g_io_channel_seek_position")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> FFI.Int64.PolyML.cVal
             &&> GLibSeekType.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val setBufferSize_ = call (load_sym libglib "g_io_channel_set_buffer_size") (GLibIOChannelRecord.PolyML.cPtr &&> FFI.Size.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBuffered_ = call (load_sym libglib "g_io_channel_set_buffered") (GLibIOChannelRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCloseOnUnref_ = call (load_sym libglib "g_io_channel_set_close_on_unref") (GLibIOChannelRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setEncoding_ =
        call (load_sym libglib "g_io_channel_set_encoding")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val setFlags_ =
        call (load_sym libglib "g_io_channel_set_flags")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GLibIOFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val setLineTerm_ =
        call (load_sym libglib "g_io_channel_set_line_term")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val shutdown_ =
        call (load_sym libglib "g_io_channel_shutdown")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val unixGetFd_ = call (load_sym libglib "g_io_channel_unix_get_fd") (GLibIOChannelRecord.PolyML.cPtr --> FileDesc.PolyML.cVal)
      val writeUnichar_ =
        call (load_sym libglib "g_io_channel_write_unichar")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> FFI.Char.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val errorFromErrno_ = call (load_sym libglib "g_io_channel_error_from_errno") (FFI.Int.PolyML.cVal --> GLibIOChannelError.PolyML.cVal)
    end
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
    fun unixNew fd = (FileDesc.C.withVal ---> GLibIOChannelRecord.C.fromPtr true) unixNew_ fd
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
    fun unixGetFd self = (GLibIOChannelRecord.C.withPtr ---> FileDesc.C.fromVal) unixGetFd_ self
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
