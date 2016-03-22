signature GIO_INET_ADDRESS_CLASS =
  sig
    type 'a inet_address
    include
      CLASS
        where type 'a class = 'a inet_address GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
