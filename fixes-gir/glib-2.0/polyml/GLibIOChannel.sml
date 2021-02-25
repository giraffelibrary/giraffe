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
      val getType_ = call (externalFunctionSymbol "g_io_channel_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFile_ =
        call (externalFunctionSymbol "g_io_channel_new_file")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOChannelRecord.PolyML.cPtr
          )
      val unixNew_ = call (externalFunctionSymbol "g_io_channel_unix_new") (GFileDesc.PolyML.cVal --> GLibIOChannelRecord.PolyML.cPtr)
      val close_ = call (externalFunctionSymbol "g_io_channel_close") (GLibIOChannelRecord.PolyML.cPtr --> cVoid)
      val flush_ = call (externalFunctionSymbol "g_io_channel_flush") (GLibIOChannelRecord.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GLibIOStatus.PolyML.cVal)
      val getBufferCondition_ = call (externalFunctionSymbol "g_io_channel_get_buffer_condition") (GLibIOChannelRecord.PolyML.cPtr --> GLibIOCondition.PolyML.cVal)
      val getBufferSize_ = call (externalFunctionSymbol "g_io_channel_get_buffer_size") (GLibIOChannelRecord.PolyML.cPtr --> GSize.PolyML.cVal)
      val getBuffered_ = call (externalFunctionSymbol "g_io_channel_get_buffered") (GLibIOChannelRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCloseOnUnref_ = call (externalFunctionSymbol "g_io_channel_get_close_on_unref") (GLibIOChannelRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEncoding_ = call (externalFunctionSymbol "g_io_channel_get_encoding") (GLibIOChannelRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFlags_ = call (externalFunctionSymbol "g_io_channel_get_flags") (GLibIOChannelRecord.PolyML.cPtr --> GLibIOFlags.PolyML.cVal)
      val init_ = call (externalFunctionSymbol "g_io_channel_init") (GLibIOChannelRecord.PolyML.cPtr --> cVoid)
      val readChars_ =
        call (externalFunctionSymbol "g_io_channel_read_chars")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val readLine_ =
        call (externalFunctionSymbol "g_io_channel_read_line")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GSize.PolyML.cRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val readToEnd_ =
        call (externalFunctionSymbol "g_io_channel_read_to_end")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cOutRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val readUnichar_ =
        call (externalFunctionSymbol "g_io_channel_read_unichar")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GChar.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val seek_ =
        call (externalFunctionSymbol "g_io_channel_seek")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GLibSeekType.PolyML.cVal
             --> GLibIOError.PolyML.cVal
          )
      val seekPosition_ =
        call (externalFunctionSymbol "g_io_channel_seek_position")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GInt64.PolyML.cVal
             &&> GLibSeekType.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val setBufferSize_ = call (externalFunctionSymbol "g_io_channel_set_buffer_size") (GLibIOChannelRecord.PolyML.cPtr &&> GSize.PolyML.cVal --> cVoid)
      val setBuffered_ = call (externalFunctionSymbol "g_io_channel_set_buffered") (GLibIOChannelRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCloseOnUnref_ = call (externalFunctionSymbol "g_io_channel_set_close_on_unref") (GLibIOChannelRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEncoding_ =
        call (externalFunctionSymbol "g_io_channel_set_encoding")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val setFlags_ =
        call (externalFunctionSymbol "g_io_channel_set_flags")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GLibIOFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val setLineTerm_ =
        call (externalFunctionSymbol "g_io_channel_set_line_term")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val shutdown_ =
        call (externalFunctionSymbol "g_io_channel_shutdown")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val unixGetFd_ = call (externalFunctionSymbol "g_io_channel_unix_get_fd") (GLibIOChannelRecord.PolyML.cPtr --> GFileDesc.PolyML.cVal)
      val writeUnichar_ =
        call (externalFunctionSymbol "g_io_channel_write_unichar")
          (
            GLibIOChannelRecord.PolyML.cPtr
             &&> GChar.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibIOStatus.PolyML.cVal
          )
      val errorFromErrno_ = call (externalFunctionSymbol "g_io_channel_error_from_errno") (GInt.PolyML.cVal --> GLibIOChannelError.PolyML.cVal)
    end
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
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
    fun close self = (GLibIOChannelRecord.FFI.withPtr false ---> I) close_ self
    fun flush self = (GLibIOChannelRecord.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GLibIOStatus.FFI.fromVal) flush_ (self & [])
    fun getBufferCondition self = (GLibIOChannelRecord.FFI.withPtr false ---> GLibIOCondition.FFI.fromVal) getBufferCondition_ self
    fun getBufferSize self = (GLibIOChannelRecord.FFI.withPtr false ---> GSize.FFI.fromVal) getBufferSize_ self
    fun getBuffered self = (GLibIOChannelRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getBuffered_ self
    fun getCloseOnUnref self = (GLibIOChannelRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getCloseOnUnref_ self
    fun getEncoding self = (GLibIOChannelRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getEncoding_ self before GLibIOChannelRecord.FFI.touchPtr self
    fun getFlags self = (GLibIOChannelRecord.FFI.withPtr false ---> GLibIOFlags.FFI.fromVal) getFlags_ self
    fun init self = (GLibIOChannelRecord.FFI.withPtr false ---> I) init_ self
    fun readChars self count =
      let
        val buf
         & bytesRead
         & retVal =
          (
            GLibIOChannelRecord.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withNewPtr
             &&&> GSize.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr ~1
                   && GSize.FFI.fromVal
                   && GLibIOStatus.FFI.fromVal
          )
            readChars_
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
    fun readLine self =
      let
        val strReturn
         & length
         & terminatorPos
         & retVal =
          (
            GLibIOChannelRecord.FFI.withPtr false
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr ~1
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
            GLibIOChannelRecord.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withRefOptPtr 0
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt8CArrayN.FFI.fromPtr ~1
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
            GLibIOChannelRecord.FFI.withPtr false
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
        GLibIOChannelRecord.FFI.withPtr false
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
        GLibIOChannelRecord.FFI.withPtr false
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
    fun setBufferSize self size = (GLibIOChannelRecord.FFI.withPtr false &&&> GSize.FFI.withVal ---> I) setBufferSize_ (self & size)
    fun setBuffered self buffered = (GLibIOChannelRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setBuffered_ (self & buffered)
    fun setCloseOnUnref self doClose = (GLibIOChannelRecord.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCloseOnUnref_ (self & doClose)
    fun setEncoding self encoding =
      (
        GLibIOChannelRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
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
        GLibIOChannelRecord.FFI.withPtr false
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
        GLibIOChannelRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
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
        GLibIOChannelRecord.FFI.withPtr false
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
    fun unixGetFd self = (GLibIOChannelRecord.FFI.withPtr false ---> GFileDesc.FFI.fromVal) unixGetFd_ self
    fun writeUnichar self thechar =
      (
        GLibIOChannelRecord.FFI.withPtr false
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
