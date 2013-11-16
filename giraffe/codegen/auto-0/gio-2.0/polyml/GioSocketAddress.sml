structure GioSocketAddress :>
  GIO_SOCKET_ADDRESS
    where type 'a class_t = 'a GioSocketAddressClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    where type socketfamily_t = GioSocketFamily.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_socket_address_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newFromNative_ = call (load_sym libgio "g_socket_address_new_from_native") (FFI.UInt64.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getFamily_ = call (load_sym libgio "g_socket_address_get_family") (GObjectObjectClass.PolyML.PTR --> GioSocketFamily.PolyML.VAL)
      val getNativeSize_ = call (load_sym libgio "g_socket_address_get_native_size") (GObjectObjectClass.PolyML.PTR --> FFI.Int64.PolyML.VAL)
      val toNative_ =
        call (load_sym libgio "g_socket_address_to_native")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt64.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GioSocketAddressClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    type socketfamily_t = GioSocketFamily.t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromNative len = (FFI.UInt64.C.withVal ---> GioSocketAddressClass.C.fromPtr true) newFromNative_ len
    fun getFamily self = (GObjectObjectClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getNativeSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.C.fromVal) getNativeSize_ self
    fun toNative self destlen =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        toNative_
        (
          self
           & destlen
           & []
        )
    local
      open Property
    in
      val familyProp = {get = fn x => get "family" GioSocketFamily.t x}
    end
  end
