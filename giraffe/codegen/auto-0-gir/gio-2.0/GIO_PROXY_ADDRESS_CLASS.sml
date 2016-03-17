signature GIO_PROXY_ADDRESS_CLASS =
  sig
    type 'a proxy_address
    type 'a inet_socket_address_class
    type 'a class = 'a proxy_address inet_socket_address_class
    type t = base class
    val toBase : 'a class -> base class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
