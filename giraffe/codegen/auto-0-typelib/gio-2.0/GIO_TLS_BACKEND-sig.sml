signature GIO_TLS_BACKEND =
  sig
    type 'a class
    type 'a tls_database_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getDefault : unit -> base class
    val getCertificateType : 'a class -> GObject.Type.t
    val getClientConnectionType : 'a class -> GObject.Type.t
    val getDefaultDatabase : 'a class -> base tls_database_class
    val getDtlsClientConnectionType : 'a class -> GObject.Type.t
    val getDtlsServerConnectionType : 'a class -> GObject.Type.t
    val getFileDatabaseType : 'a class -> GObject.Type.t
    val getServerConnectionType : 'a class -> GObject.Type.t
    val supportsDtls : 'a class -> bool
    val supportsTls : 'a class -> bool
  end
