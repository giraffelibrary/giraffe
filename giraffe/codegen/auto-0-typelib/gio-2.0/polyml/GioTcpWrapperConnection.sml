structure GioTcpWrapperConnection :>
  GIO_TCP_WRAPPER_CONNECTION
    where type 'a class = 'a GioTcpWrapperConnectionClass.class
    where type 'a socket_class = 'a GioSocketClass.class
    where type 'a i_o_stream_class = 'a GioIOStreamClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tcp_wrapper_connection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_tcp_wrapper_connection_new") (GioIOStreamClass.PolyML.cPtr &&> GioSocketClass.PolyML.cPtr --> GioSocketConnectionClass.PolyML.cPtr)
      val getBaseIoStream_ = call (load_sym libgio "g_tcp_wrapper_connection_get_base_io_stream") (GioTcpWrapperConnectionClass.PolyML.cPtr --> GioIOStreamClass.PolyML.cPtr)
    end
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
