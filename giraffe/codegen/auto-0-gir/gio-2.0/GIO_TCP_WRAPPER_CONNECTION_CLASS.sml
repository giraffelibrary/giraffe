signature GIO_TCP_WRAPPER_CONNECTION_CLASS =
  sig
    type 'a tcp_wrapper_connection
    type 'a tcp_connection_class_t
    type 'a t = 'a tcp_wrapper_connection tcp_connection_class_t
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
