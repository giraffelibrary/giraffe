signature GIO_INET_ADDRESS_CLASS =
  sig
    type 'a inet_address
    include
      CLASS
        where type 'a class = 'a inet_address GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
