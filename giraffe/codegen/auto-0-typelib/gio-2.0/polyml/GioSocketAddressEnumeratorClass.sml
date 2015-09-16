structure GioSocketAddressEnumeratorClass :>
  GIO_SOCKET_ADDRESS_ENUMERATOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a socket_address_enumerator = unit
    type 'a t = 'a socket_address_enumerator GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
