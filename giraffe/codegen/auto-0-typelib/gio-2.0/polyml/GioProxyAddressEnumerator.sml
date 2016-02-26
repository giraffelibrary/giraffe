structure GioProxyAddressEnumerator :>
  GIO_PROXY_ADDRESS_ENUMERATOR
    where type 'a class_t = 'a GioProxyAddressEnumeratorClass.t
    where type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_proxy_address_enumerator_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class_t = 'a GioProxyAddressEnumeratorClass.t
    type 'a socket_connectable_class_t = 'a GioSocketConnectableClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    local
      open Property
    in
      val connectableProp =
        {
          get = fn x => get "connectable" GioSocketConnectableClass.tOpt x,
          set = fn x => set "connectable" GioSocketConnectableClass.tOpt x
        }
      val uriProp =
        {
          get = fn x => get "uri" stringOpt x,
          set = fn x => set "uri" stringOpt x
        }
    end
  end
