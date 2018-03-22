signature GIO_SOCKET_CONNECTION_CLASS =
  sig
    type 'a socket_connection
    type 'a i_o_stream_class
    include
      CLASS
        where type 'a class = 'a socket_connection i_o_stream_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
