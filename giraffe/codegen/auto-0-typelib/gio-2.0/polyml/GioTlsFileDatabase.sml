structure GioTlsFileDatabase :>
  GIO_TLS_FILE_DATABASE
    where type 'a class = 'a GioTlsFileDatabaseClass.class
    where type 'a tls_database_class = 'a GioTlsDatabaseClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_file_database_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_tls_file_database_new") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a GioTlsFileDatabaseClass.class
    type 'a tls_database_class = 'a GioTlsDatabaseClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new anchors = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GioTlsDatabaseClass.C.fromPtr true) new_ (anchors & [])
    local
      open Property
    in
      val anchorsProp =
        {
          get = fn x => get "anchors" stringOpt x,
          set = fn x => set "anchors" stringOpt x
        }
    end
  end
