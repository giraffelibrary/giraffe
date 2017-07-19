structure GioTcpWrapperConnection :>
  GIO_TCP_WRAPPER_CONNECTION
    where type 'a class = 'a GioTcpWrapperConnectionClass.class
    where type 'a socket_class = 'a GioSocketClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_tcp_wrapper_connection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_tcp_wrapper_connection_new") (GioIOStreamClass.PolyML.cPtr &&> GioSocketClass.PolyML.cPtr --> GioSocketConnectionClass.PolyML.cPtr)
      val getBaseIoStream_ = call (getSymbol "g_tcp_wrapper_connection_get_base_io_stream") (GioTcpWrapperConnectionClass.PolyML.cPtr --> GioIOStreamClass.PolyML.cPtr)
    end
    type 'a class = 'a GioTcpWrapperConnectionClass.class
    type 'a socket_class = 'a GioSocketClass.class
    type 'a i_o_stream_class = 'a GioIOStreamClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (baseIoStream, socket) = (GioIOStreamClass.FFI.withPtr &&&> GioSocketClass.FFI.withPtr ---> GioTcpWrapperConnectionClass.FFI.fromPtr true) new_ (baseIoStream & socket)
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
