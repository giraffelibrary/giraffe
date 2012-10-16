structure GioTlsFileDatabaseClass :>
  GIO_TLS_FILE_DATABASE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a tlsfiledatabase = unit
    type 'a t = 'a tlsfiledatabase GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
