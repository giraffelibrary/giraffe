structure GioProxyAddressClass :>
  GIO_PROXY_ADDRESS_CLASS
    where type 'a inetsocketaddressclass_t = 'a GioInetSocketAddressClass.t
    where type C.notnull = GioInetSocketAddressClass.C.notnull
    where type 'a C.p = 'a GioInetSocketAddressClass.C.p =
  struct
    type 'a proxyaddress = unit
    type 'a inetsocketaddressclass_t = 'a GioInetSocketAddressClass.t
    type 'a t = 'a proxyaddress inetsocketaddressclass_t
    fun toBase obj = obj
    val t = GioInetSocketAddressClass.t
    val tOpt = GioInetSocketAddressClass.tOpt
    structure C = GioInetSocketAddressClass.C
  end
