signature GIO_NETWORK_ADDRESS_CLASS =
  sig
    type 'a network_address
    include
      CLASS
        where type 'a class = 'a network_address GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
