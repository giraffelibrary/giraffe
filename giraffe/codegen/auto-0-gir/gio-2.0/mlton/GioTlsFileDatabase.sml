structure GioTlsFileDatabase :>
  GIO_TLS_FILE_DATABASE
    where type 'a class_t = 'a GioTlsFileDatabaseClass.t
    where type 'a tls_database_class_t = 'a GioTlsDatabaseClass.t =
  struct
    val getType_ = _import "g_tls_file_database_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_tls_file_database_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioTlsFileDatabaseClass.t
    type 'a tls_database_class_t = 'a GioTlsDatabaseClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new anchors = (Utf8.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioTlsDatabaseClass.C.fromPtr true) new_ (anchors & [])
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
