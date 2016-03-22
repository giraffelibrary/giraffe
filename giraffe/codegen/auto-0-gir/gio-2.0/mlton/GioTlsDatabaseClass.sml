structure GioTlsDatabaseClass :>
  GIO_TLS_DATABASE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tls_database = unit
    type 'a class = 'a tls_database class
  end
