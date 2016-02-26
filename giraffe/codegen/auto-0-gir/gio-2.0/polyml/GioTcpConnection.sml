structure GioTcpConnection :>
  GIO_TCP_CONNECTION
    where type 'a class_t = 'a GioTcpConnectionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_tcp_connection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getGracefulDisconnect_ = call (load_sym libgio "g_tcp_connection_get_graceful_disconnect") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setGracefulDisconnect_ = call (load_sym libgio "g_tcp_connection_set_graceful_disconnect") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GioTcpConnectionClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getGracefulDisconnect self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getGracefulDisconnect_ self
    fun setGracefulDisconnect self gracefulDisconnect = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setGracefulDisconnect_ (self & gracefulDisconnect)
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
