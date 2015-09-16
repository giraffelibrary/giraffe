signature GIO_UNIX_SOCKET_ADDRESS_CLASS =
  sig
    type 'a unix_socket_address
    type 'a socket_address_class_t
    type 'a t = 'a unix_socket_address socket_address_class_t
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
