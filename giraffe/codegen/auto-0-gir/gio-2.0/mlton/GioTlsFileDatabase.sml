structure GioTlsFileDatabase :>
  GIO_TLS_FILE_DATABASE
    where type 'a class = 'a GioTlsFileDatabaseClass.class =
  struct
    val getType_ = _import "g_tls_file_database_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_tls_file_database_new" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioTlsFileDatabaseClass.FFI.non_opt GioTlsFileDatabaseClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioTlsFileDatabaseClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new anchors = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GioTlsFileDatabaseClass.FFI.fromPtr true) new_ (anchors & [])
    local
      open ValueAccessor
    in
      val anchorsProp =
        {
          name = "anchors",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
