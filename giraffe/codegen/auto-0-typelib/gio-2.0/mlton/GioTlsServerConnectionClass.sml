structure GioTlsServerConnectionClass :>
  GIO_TLS_SERVER_CONNECTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a tls_server_connection = unit
    type 'a t = 'a tls_server_connection GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
