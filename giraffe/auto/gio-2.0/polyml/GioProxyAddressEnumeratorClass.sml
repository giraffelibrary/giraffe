structure GioProxyAddressEnumeratorClass :>
  GIO_PROXY_ADDRESS_ENUMERATOR_CLASS
    where type 'a socketaddressenumeratorclass_t = 'a GioSocketAddressEnumeratorClass.t
    where type C.notnull = GioSocketAddressEnumeratorClass.C.notnull
    where type 'a C.p = 'a GioSocketAddressEnumeratorClass.C.p =
  struct
    type 'a proxyaddressenumerator = unit
    type 'a socketaddressenumeratorclass_t = 'a GioSocketAddressEnumeratorClass.t
    type 'a t = 'a proxyaddressenumerator socketaddressenumeratorclass_t
    fun toBase obj = obj
    val t = GioSocketAddressEnumeratorClass.t
    val tOpt = GioSocketAddressEnumeratorClass.tOpt
    structure C = GioSocketAddressEnumeratorClass.C
  end
