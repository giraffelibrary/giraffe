structure GioTlsFileDatabaseClass :>
  GIO_TLS_FILE_DATABASE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tls_file_database = unit
    type 'a class = 'a tls_file_database class
  end
