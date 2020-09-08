structure GioTlsFileDatabase :>
  GIO_TLS_FILE_DATABASE
    where type 'a class = 'a GioTlsFileDatabaseClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tls_file_database_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_tls_file_database_new") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioTlsFileDatabaseClass.PolyML.cPtr)
    end
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
