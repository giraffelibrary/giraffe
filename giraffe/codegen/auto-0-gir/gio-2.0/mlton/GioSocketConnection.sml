structure GioSocketConnection :>
  GIO_SOCKET_CONNECTION
    where type 'a class = 'a GioSocketConnectionClass.class
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type 'a socket_class = 'a GioSocketClass.class =
  struct
    val getType_ = _import "g_socket_connection_get_type" : unit -> GObjectType.C.val_;
    val getLocalAddress_ = fn x1 & x2 => (_import "g_socket_connection_get_local_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getRemoteAddress_ = fn x1 & x2 => (_import "g_socket_connection_get_remote_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getSocket_ = _import "g_socket_connection_get_socket" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class = 'a GioSocketConnectionClass.class
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a socket_class = 'a GioSocketClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLocalAddress self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.C.fromPtr true) getLocalAddress_ (self & [])
    fun getRemoteAddress self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.C.fromPtr true) getRemoteAddress_ (self & [])
    fun getSocket self = (GObjectObjectClass.C.withPtr ---> GioSocketClass.C.fromPtr false) getSocket_ self
    local
      open Property
    in
      val socketProp =
        {
          get = fn x => get "socket" GioSocketClass.tOpt x,
          set = fn x => set "socket" GioSocketClass.tOpt x
        }
    end
  end
