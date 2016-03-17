signature GIO_PROXY_ADDRESS_ENUMERATOR_CLASS =
  sig
    type 'a proxy_address_enumerator
    type 'a socket_address_enumerator_class
    type 'a class = 'a proxy_address_enumerator socket_address_enumerator_class
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
