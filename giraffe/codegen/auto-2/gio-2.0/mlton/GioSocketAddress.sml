structure GioSocketAddress :>
  GIO_SOCKET_ADDRESS
    where type 'a class_t = 'a GioSocketAddressClass.t
    where type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    where type socketfamily_t = GioSocketFamily.t =
  struct
    val getType_ = _import "g_socket_address_get_type" : unit -> GObjectType.C.val_;
    val newFromNative_ = _import "g_socket_address_new_from_native" : FFI.UInt64.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFamily_ = _import "g_socket_address_get_family" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioSocketFamily.C.val_;
    val getNativeSize_ = _import "g_socket_address_get_native_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int64.val_;
    val toNative_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_socket_address_to_native" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt64.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioSocketAddressClass.t
    type 'a socketconnectableclass_t = 'a GioSocketConnectableClass.t
    type socketfamily_t = GioSocketFamily.t
    fun asSocketConnectable self = (GObjectObjectClass.C.withPtr ---> GioSocketConnectableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newFromNative len = (FFI.UInt64.withVal ---> GioSocketAddressClass.C.fromPtr true) newFromNative_ len
    fun getFamily self = (GObjectObjectClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getNativeSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int64.fromVal) getNativeSize_ self
    fun toNative self destlen =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
