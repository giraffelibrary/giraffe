structure GioUnixSocketAddressClass :>
  GIO_UNIX_SOCKET_ADDRESS_CLASS
    where type 'a socketaddressclass_t = 'a GioSocketAddressClass.t
    where type C.notnull = GioSocketAddressClass.C.notnull
    where type 'a C.p = 'a GioSocketAddressClass.C.p =
  struct
    type 'a unixsocketaddress = unit
    type 'a socketaddressclass_t = 'a GioSocketAddressClass.t
    type 'a t = 'a unixsocketaddress socketaddressclass_t
    fun toBase obj = obj
    val t = GioSocketAddressClass.t
    val tOpt = GioSocketAddressClass.tOpt
    structure C = GioSocketAddressClass.C
  end
