signature GIO_TLS_FILE_DATABASE_CLASS =
  sig
    type 'a tls_file_database
    include
      CLASS
        where type 'a class = 'a tls_file_database GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
