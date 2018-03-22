signature GIO_INET_ADDRESS_MASK_CLASS =
  sig
    type 'a inet_address_mask
    include
      CLASS
        where type 'a class = 'a inet_address_mask GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
