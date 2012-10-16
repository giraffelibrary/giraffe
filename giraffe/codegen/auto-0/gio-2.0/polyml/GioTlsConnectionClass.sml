structure GioTlsConnectionClass :>
  GIO_TLS_CONNECTION_CLASS
    where type 'a iostreamclass_t = 'a GioIOStreamClass.t
    where type C.notnull = GioIOStreamClass.C.notnull
    where type 'a C.p = 'a GioIOStreamClass.C.p =
  struct
    type 'a tlsconnection = unit
    type 'a iostreamclass_t = 'a GioIOStreamClass.t
    type 'a t = 'a tlsconnection iostreamclass_t
    fun toBase obj = obj
    val t = GioIOStreamClass.t
    val tOpt = GioIOStreamClass.tOpt
    structure C = GioIOStreamClass.C
  end
