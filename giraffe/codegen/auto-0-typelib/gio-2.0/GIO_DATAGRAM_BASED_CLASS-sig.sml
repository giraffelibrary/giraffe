signature GIO_DATAGRAM_BASED_CLASS =
  sig
    type 'a datagram_based
    include
      CLASS
        where type 'a class = 'a datagram_based GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
