structure GioSocketConnectionClass :>
  GIO_SOCKET_CONNECTION_CLASS
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class
    where type C.notnull = GioIOStreamClass.C.notnull
    where type 'a C.p = 'a GioIOStreamClass.C.p =
  struct
    type 'a socket_connection = unit
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type 'a class = 'a socket_connection i_o_stream_class
    type t = base class
    fun toBase obj = obj
    val t = GioIOStreamClass.t
    val tOpt = GioIOStreamClass.tOpt
    structure C = GioIOStreamClass.C
  end
