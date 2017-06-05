structure GioTcpConnection :>
  GIO_TCP_CONNECTION
    where type 'a class = 'a GioTcpConnectionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tcp_connection_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getGracefulDisconnect_ = call (load_sym libgio "g_tcp_connection_get_graceful_disconnect") (GioTcpConnectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setGracefulDisconnect_ = call (load_sym libgio "g_tcp_connection_set_graceful_disconnect") (GioTcpConnectionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioTcpConnectionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getGracefulDisconnect self = (GioTcpConnectionClass.FFI.withPtr ---> GBool.FFI.fromVal) getGracefulDisconnect_ self
    fun setGracefulDisconnect self gracefulDisconnect = (GioTcpConnectionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setGracefulDisconnect_ (self & gracefulDisconnect)
    local
      open Property
    in
      val gracefulDisconnectProp =
        {
          get = fn x => get "graceful-disconnect" boolean x,
          set = fn x => set "graceful-disconnect" boolean x
        }
    end
  end
