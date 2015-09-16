signature GIO_PROXY_ADDRESS_CLASS =
  sig
    type 'a proxy_address
    type 'a inet_socket_address_class_t
    type 'a t = 'a proxy_address inet_socket_address_class_t
    val toBase : 'a t -> base t
    val t : (base t, 'a t) GObject.Value.accessor
    val tOpt : (base t option, 'a t option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a t
        val fromOptPtr :
          bool
           -> unit p
           -> 'a t option
      end
  end
