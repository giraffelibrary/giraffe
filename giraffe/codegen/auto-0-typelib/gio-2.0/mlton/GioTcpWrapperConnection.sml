structure GioTcpWrapperConnection :>
  GIO_TCP_WRAPPER_CONNECTION
    where type 'a class = 'a GioTcpWrapperConnectionClass.class
    where type 'a socket_class = 'a GioSocketClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class =
  struct
    val getType_ = _import "g_tcp_wrapper_connection_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_tcp_wrapper_connection_new" : GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p * GioSocketClass.FFI.notnull GioSocketClass.FFI.p -> GioSocketConnectionClass.FFI.notnull GioSocketConnectionClass.FFI.p;) (x1, x2)
    val getBaseIoStream_ = _import "g_tcp_wrapper_connection_get_base_io_stream" : GioTcpWrapperConnectionClass.FFI.notnull GioTcpWrapperConnectionClass.FFI.p -> GioIOStreamClass.FFI.notnull GioIOStreamClass.FFI.p;
    type 'a class = 'a GioTcpWrapperConnectionClass.class
    type 'a socket_class = 'a GioSocketClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new baseIoStream socket = (GioIOStreamClass.FFI.withPtr &&&> GioSocketClass.FFI.withPtr ---> GioTcpWrapperConnectionClass.FFI.fromPtr true) new_ (baseIoStream & socket)
    fun getBaseIoStream self = (GioTcpWrapperConnectionClass.FFI.withPtr ---> GioIOStreamClass.FFI.fromPtr false) getBaseIoStream_ self
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
