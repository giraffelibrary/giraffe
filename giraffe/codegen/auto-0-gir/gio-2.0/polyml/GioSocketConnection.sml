structure GioSocketConnection :>
  GIO_SOCKET_CONNECTION
    where type 'a class = 'a GioSocketConnectionClass.class
    where type 'a socket_address_class = 'a GioSocketAddressClass.class
    where type 'a socket_class = 'a GioSocketClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_connection_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getLocalAddress_ = call (load_sym libgio "g_socket_connection_get_local_address") (GioSocketConnectionClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getRemoteAddress_ = call (load_sym libgio "g_socket_connection_get_remote_address") (GioSocketConnectionClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioSocketAddressClass.PolyML.cPtr)
      val getSocket_ = call (load_sym libgio "g_socket_connection_get_socket") (GioSocketConnectionClass.PolyML.cPtr --> GioSocketClass.PolyML.cPtr)
    end
    type 'a class = 'a GioSocketConnectionClass.class
    type 'a socket_address_class = 'a GioSocketAddressClass.class
    type 'a socket_class = 'a GioSocketClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLocalAddress self = (GioSocketConnectionClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.C.fromPtr true) getLocalAddress_ (self & [])
    fun getRemoteAddress self = (GioSocketConnectionClass.C.withPtr &&&> GLibErrorRecord.handleError ---> GioSocketAddressClass.C.fromPtr true) getRemoteAddress_ (self & [])
    fun getSocket self = (GioSocketConnectionClass.C.withPtr ---> GioSocketClass.C.fromPtr false) getSocket_ self
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
