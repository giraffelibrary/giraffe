structure GLibMappedFile :>
  G_LIB_MAPPED_FILE
    where type t = GLibMappedFileRecord.t
    where type bytes_t = GLibBytesRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_mapped_file_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_mapped_file_new")
          (
            Utf8.PolyML.cInPtr
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibMappedFileRecord.PolyML.cPtr
          )
      val newFromFd_ =
        call (getSymbol "g_mapped_file_new_from_fd")
          (
            GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibMappedFileRecord.PolyML.cPtr
          )
      val getBytes_ = call (getSymbol "g_mapped_file_get_bytes") (GLibMappedFileRecord.PolyML.cPtr --> GLibBytesRecord.PolyML.cPtr)
      val getContents_ = call (getSymbol "g_mapped_file_get_contents") (GLibMappedFileRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLength_ = call (getSymbol "g_mapped_file_get_length") (GLibMappedFileRecord.PolyML.cPtr --> GSize.PolyML.cVal)
    end
    type t = GLibMappedFileRecord.t
    type bytes_t = GLibBytesRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (filename, writable) =
      (
        Utf8.FFI.withPtr 0
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibMappedFileRecord.FFI.fromPtr true
      )
        new_
        (
          filename
           & writable
           & []
        )
    fun newFromFd (fd, writable) =
      (
        GInt.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibMappedFileRecord.FFI.fromPtr true
      )
        newFromFd_
        (
          fd
           & writable
           & []
        )
    fun getBytes self = (GLibMappedFileRecord.FFI.withPtr false ---> GLibBytesRecord.FFI.fromPtr true) getBytes_ self
    fun getContents self = (GLibMappedFileRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getContents_ self
    fun getLength self = (GLibMappedFileRecord.FFI.withPtr false ---> GSize.FFI.fromVal) getLength_ self
  end
