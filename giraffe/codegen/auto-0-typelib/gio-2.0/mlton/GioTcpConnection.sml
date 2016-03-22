structure GioTcpConnection :>
  GIO_TCP_CONNECTION
    where type 'a class = 'a GioTcpConnectionClass.class =
  struct
    val getType_ = _import "g_tcp_connection_get_type" : unit -> GObjectType.C.val_;
    val getGracefulDisconnect_ = _import "g_tcp_connection_get_graceful_disconnect" : GioTcpConnectionClass.C.notnull GioTcpConnectionClass.C.p -> FFI.Bool.C.val_;
    val setGracefulDisconnect_ = fn x1 & x2 => (_import "g_tcp_connection_set_graceful_disconnect" : GioTcpConnectionClass.C.notnull GioTcpConnectionClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioTcpConnectionClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getGracefulDisconnect self = (GioTcpConnectionClass.C.withPtr ---> FFI.Bool.C.fromVal) getGracefulDisconnect_ self
    fun setGracefulDisconnect self gracefulDisconnect = (GioTcpConnectionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setGracefulDisconnect_ (self & gracefulDisconnect)
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
