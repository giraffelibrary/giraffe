structure GioTcpWrapperConnection :>
  GIO_TCP_WRAPPER_CONNECTION
    where type 'a class = 'a GioTcpWrapperConnectionClass.class
    where type 'a socket_class = 'a GioSocketClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class =
  struct
    val getType_ = _import "g_tcp_wrapper_connection_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_tcp_wrapper_connection_new" : GioIOStreamClass.C.notnull GioIOStreamClass.C.p * GioSocketClass.C.notnull GioSocketClass.C.p -> GioSocketConnectionClass.C.notnull GioSocketConnectionClass.C.p;) (x1, x2)
    val getBaseIoStream_ = _import "g_tcp_wrapper_connection_get_base_io_stream" : GioTcpWrapperConnectionClass.C.notnull GioTcpWrapperConnectionClass.C.p -> GioIOStreamClass.C.notnull GioIOStreamClass.C.p;
    type 'a class = 'a GioTcpWrapperConnectionClass.class
    type 'a socket_class = 'a GioSocketClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new baseIoStream socket = (GioIOStreamClass.C.withPtr &&&> GioSocketClass.C.withPtr ---> GioTcpWrapperConnectionClass.C.fromPtr true) new_ (baseIoStream & socket)
    fun getBaseIoStream self = (GioTcpWrapperConnectionClass.C.withPtr ---> GioIOStreamClass.C.fromPtr false) getBaseIoStream_ self
    local
      open Property
    in
      val baseIoStreamProp =
        {
          get = fn x => get "base-io-stream" GioIOStreamClass.tOpt x,
          set = fn x => set "base-io-stream" GioIOStreamClass.tOpt x
        }
    end
  end
