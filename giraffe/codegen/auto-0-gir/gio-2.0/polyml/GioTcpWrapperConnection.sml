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
    fun new (baseIoStream, socket) = (GioIOStreamClass.FFI.withPtr false &&&> GioSocketClass.FFI.withPtr false ---> GioTcpWrapperConnectionClass.FFI.fromPtr true) new_ (baseIoStream & socket)
    fun getBaseIoStream self = (GioTcpWrapperConnectionClass.FFI.withPtr false ---> GioIOStreamClass.FFI.fromPtr false) getBaseIoStream_ self before GioTcpWrapperConnectionClass.FFI.touchPtr self
    local
      open ValueAccessor
    in
      val baseIoStreamProp =
        {
          name = "base-io-stream",
          gtype = fn () => C.gtype GioIOStreamClass.tOpt (),
          get = fn x => fn () => C.get GioIOStreamClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioIOStreamClass.tOpt x
        }
    end
  end
