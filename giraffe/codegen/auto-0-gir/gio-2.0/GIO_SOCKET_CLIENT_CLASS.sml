signature GIO_SOCKET_CLIENT_CLASS =
  sig
    type 'a socket_client
    include
      CLASS
        where type 'a class = 'a socket_client GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
