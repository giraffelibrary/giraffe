structure GioTlsServerConnectionClass :>
  GIO_TLS_SERVER_CONNECTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a tlsserverconnection = unit
    type 'a t = 'a tlsserverconnection GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
