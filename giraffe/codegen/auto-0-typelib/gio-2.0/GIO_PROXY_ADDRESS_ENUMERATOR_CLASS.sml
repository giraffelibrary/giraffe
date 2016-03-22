signature GIO_PROXY_ADDRESS_ENUMERATOR_CLASS =
  sig
    type 'a proxy_address_enumerator
    type 'a socket_address_enumerator_class
    include
      CLASS
        where type 'a class = 'a proxy_address_enumerator socket_address_enumerator_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
