structure GioTlsFileDatabase :>
  GIO_TLS_FILE_DATABASE
    where type 'a class_t = 'a GioTlsFileDatabaseClass.t
    where type 'a tlsdatabaseclass_t = 'a GioTlsDatabaseClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tls_file_database_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_tls_file_database_new") (FFI.String.PolyML.INPTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioTlsFileDatabaseClass.t
    type 'a tlsdatabaseclass_t = 'a GioTlsDatabaseClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new anchors = (FFI.String.C.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GioTlsDatabaseClass.C.fromPtr true) new_ (anchors & [])
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
