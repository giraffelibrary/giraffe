structure GioSocketConnection :>
  GIO_SOCKET_CONNECTION
    where type 'a class_t = 'a GioSocketConnectionClass.t
    where type 'a socket_address_class_t = 'a GioSocketAddressClass.t
    where type 'a socket_class_t = 'a GioSocketClass.t =
  struct
    val getType_ = _import "g_socket_connection_get_type" : unit -> GObjectType.C.val_;
    val getLocalAddress_ = fn x1 & x2 => (_import "g_socket_connection_get_local_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getRemoteAddress_ = fn x1 & x2 => (_import "g_socket_connection_get_remote_address" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getSocket_ = _import "g_socket_connection_get_socket" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GioSocketConnectionClass.t
    type 'a socket_address_class_t = 'a GioSocketAddressClass.t
    type 'a socket_class_t = 'a GioSocketClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLocalAddress self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioSocketAddressClass.C.fromPtr true) getLocalAddress_ (self & [])
    fun getRemoteAddress self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> GioSocketAddressClass.C.fromPtr true) getRemoteAddress_ (self & [])
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
