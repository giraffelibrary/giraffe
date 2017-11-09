signature GIO_NETWORK_ADDRESS_CLASS =
  sig
    type 'a network_address
    include
      CLASS
        where type 'a class = 'a network_address GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
