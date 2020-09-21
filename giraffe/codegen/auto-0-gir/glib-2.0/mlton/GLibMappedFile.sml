structure GLibMappedFile :>
  G_LIB_MAPPED_FILE
    where type t = GLibMappedFileRecord.t
    where type bytes_t = GLibBytesRecord.t =
  struct
    val getType_ = _import "g_mapped_file_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_mapped_file_new" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibMappedFileRecord.FFI.non_opt GLibMappedFileRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newFromFd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_mapped_file_new_from_fd" :
              GInt.FFI.val_
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibMappedFileRecord.FFI.non_opt GLibMappedFileRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBytes_ = _import "g_mapped_file_get_bytes" : GLibMappedFileRecord.FFI.non_opt GLibMappedFileRecord.FFI.p -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
    val getContents_ = _import "g_mapped_file_get_contents" : GLibMappedFileRecord.FFI.non_opt GLibMappedFileRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getLength_ = _import "g_mapped_file_get_length" : GLibMappedFileRecord.FFI.non_opt GLibMappedFileRecord.FFI.p -> GSize.FFI.val_;
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
