signature GIO_SOCKET_ADDRESS_ENUMERATOR_CLASS =
  sig
    type 'a socket_address_enumerator
    include
      CLASS
        where type 'a class = 'a socket_address_enumerator GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
