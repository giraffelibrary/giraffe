structure GioSocketConnection :>
  GIO_SOCKET_CONNECTION
    where type 'a class_t = 'a GioSocketConnectionClass.t
    where type 'a socketaddressclass_t = 'a GioSocketAddressClass.t
    where type 'a socketclass_t = 'a GioSocketClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_connection_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getLocalAddress_ = call (load_sym libgio "g_socket_connection_get_local_address") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val getRemoteAddress_ = call (load_sym libgio "g_socket_connection_get_remote_address") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> GObjectObjectClass.PolyML.PTR)
      val getSocket_ = call (load_sym libgio "g_socket_connection_get_socket") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GioSocketConnectionClass.t
    type 'a socketaddressclass_t = 'a GioSocketAddressClass.t
    type 'a socketclass_t = 'a GioSocketClass.t
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
