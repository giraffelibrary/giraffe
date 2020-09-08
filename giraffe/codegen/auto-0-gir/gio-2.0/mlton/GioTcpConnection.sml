structure GioTcpConnection :>
  GIO_TCP_CONNECTION
    where type 'a class = 'a GioTcpConnectionClass.class =
  struct
    val getType_ = _import "g_tcp_connection_get_type" : unit -> GObjectType.FFI.val_;
    val getGracefulDisconnect_ = _import "g_tcp_connection_get_graceful_disconnect" : GioTcpConnectionClass.FFI.non_opt GioTcpConnectionClass.FFI.p -> GBool.FFI.val_;
    val setGracefulDisconnect_ = fn x1 & x2 => (_import "g_tcp_connection_set_graceful_disconnect" : GioTcpConnectionClass.FFI.non_opt GioTcpConnectionClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GioTcpConnectionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getGracefulDisconnect self = (GioTcpConnectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getGracefulDisconnect_ self
    fun setGracefulDisconnect self gracefulDisconnect = (GioTcpConnectionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setGracefulDisconnect_ (self & gracefulDisconnect)
    local
      open ValueAccessor
    in
      val gracefulDisconnectProp =
        {
          name = "graceful-disconnect",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
